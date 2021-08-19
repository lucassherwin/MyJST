<template>
  <div class="mx-16">
    <v-data-table 
      :headers="headers" 
      :items="tasks" 
      class="elevation-1" 
      show-select 
      @input="handleClick"
      :single-expand="false"
      show-expand
      @toggle-select-all="handleClick"
      v-model="selected"
    >
      <!-- add new item -->
      <template v-slot:top>
          <v-dialog v-model="dialog" max-width="500px">
            <template v-slot:activator="{ on }">
              <v-btn color="primary" dark class="mb-2" v-on="on">New Item</v-btn>
            </template>
            <v-card>
              <v-card-title>
                <span class="headline">{{ formTitle }}</span>
              </v-card-title>

              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field v-model="editedItem.title" label="Title"></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field v-model="editedItem.body" label="Description"></v-text-field>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
                <v-btn color="blue darken-1" text @click="save(editedItem)">Save</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
      </template>

      <!-- edit/delete buttons -->
      <template v-slot:item.action="{ item }">
        <v-icon small class="mr-2" @click="editItem(item)">edit</v-icon>
        <v-icon small @click="deleteItem(item)">delete</v-icon>
      </template>

      <!-- reset button -->
      <template v-slot:no-data>
        <v-btn color="primary" @click="initialize">Reset</v-btn>
      </template>

      <!-- expanded info -->
      <template v-slot:expanded-item="{ headers, item }">
        <td :colspan="headers.length">
          {{ item.body }}
        </td>
      </template>
    </v-data-table>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    dialog: false,
    headers: [
      {
        text: "ToDo List",
        align: "left",
        sortable: false,
        value: "title",
        width: '90%'
      },
      { text: "Actions", value: "action", sortable: false, width: '10%' }
    ],
    tasks: [],
    editedIndex: -1,
    editedItem: {
      title: "",
      company: "",
      contact: "",
      status: "",
      user_id: 1 // hardcode this for now
    },
    selected: []
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Item" : "Edit Item";
    }
  },
  watch: {
    dialog(val) {
      val || this.close();
    }
  },
  created() {
    this.initialize();
  },
  methods: {
    initialize() {
      return axios
      .get("http://localhost:3000/api/tasks")
      .then(response => {
        console.log(response.data);
        this.tasks = response.data;
      })
      .catch(e => {
        console.log(e);
      });

    },

    editItem(item) {
      this.editedIndex = item.id;
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    save(item) {
      // edit
      if (this.editedIndex > -1) {
        axios
          .put(`http://localhost:3000/api/tasks/${item.id}`, {
            id: this.editedItem.id,
            title: this.editedItem.title,
            company: this.editedItem.body,
            status: this.editedItem.status, // this should stay the same
            user_id: 1 // hardcode this for now
          })
          .then(response => {
          console.log(response);
          this.initialize();
          })
          .catch(error => {
          console.log(error);
        });
      } 
      // create
      else {
        axios
          .post(`http://localhost:3000/api/tasks/`, {
            task: this.editedItem
          })
          .then(response => {
            console.log(response);
            console.log("Created!");
            this.initialize();
          })
          .catch(error => {
            console.log(error);
        });
      }
      this.close();
    },

    deleteItem(item) {
      const index = this.tasks.indexOf(item);
      confirm("Are you sure you want to delete this item?"); 
      axios
        .delete(`http://localhost:3000/api/tasks/${item.id}`)
        .then(response => {
          console.log(response);
          console.log(response.data.json);
          alert(response.data.json);
          this.initialize();
        })
        .catch(error => {
          console.log(error);
        });
        this.tasks.splice(index, 1);
    },
  
    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({});
        this.editedIndex = -1;
      }, 300);
    },

    handleClick() {
      console.log('click')

      // filter out items that have a status of true
      // loop over filtered items and update
      this.selected.filter(item => !item.status).forEach(item => {
        console.log(item.id)
        axios.put(`http://localhost:3000/api/tasks/${item.id}`, {
          id: item.id,
          title: item.title,
          company: item.body,
          status: true,
          user_id: 1 // hardcode this for now
        }).then(response => {
          console.log(response);
          this.initialize();
        }).catch(error => {
          console.log(error);
        });
      })
    }
  }
};
</script>