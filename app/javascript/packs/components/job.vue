<template>
  <v-data-table :headers="headers" :items="jobs" sort-by="calories" class="elevation-1">
    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>MyJST</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-toolbar-title>MyToDo</v-toolbar-title>
        <v-spacer></v-spacer>
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
                    <v-text-field v-model="editedItem.title" label="Job Title"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.company" label="Company"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.contact" label="Contact"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-select v-model="editedItem.status" :items="['Applied', 'In Contact', 'Interview', 'Denied']" label="Status">
                      <template v-slot:item="{ item, attrs, on }">
                        <v-list-item v-bind="attrs" v-on="on">
                          <v-list-item-title :id="attrs['aria-labelledby']" v-text="item"></v-list-item-title>
                        </v-list-item>
                      </template>
                    </v-select>
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
      </v-toolbar>
    </template>
    <template v-slot:item.action="{ item }">
      <v-icon small class="mr-2" @click="editItem(item)">edit</v-icon>
      <v-icon small @click="deleteItem(item)">delete</v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize">Reset</v-btn>
    </template>
  </v-data-table>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    dialog: false,
    headers: [
      {
        text: "Job Title",
        align: "left",
        sortable: false,
        value: "title"
      },
      { text: "Company", value: "company" },
      { text: "Contact", value: "contact" },
      { text: "status", value: "status" },
      { text: "Actions", value: "action", sortable: false }
    ],
    jobs: [],
    editedIndex: -1,
    editedItem: {
      title: "",
      company: "",
      contact: "",
      status: "",
      user_id: 1 // hardcode this for now
    }
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
      .get("http://localhost:3000/jobs")
      .then(response => {
        console.log(response.data);
        this.jobs = response.data;
      })
      .catch(e => {
        console.log(e);
      });
    },

    getUser(item) {
      axios.get(`https://localhost:3000/jobs/${item.id}`)
      .then(response => {
        this.job = response.data;
        })
      .catch(error => {
        console.log(error);
      })
    },

    editItem(item) {
      this.editedIndex = item.id;
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    save(item) {
      if (this.editedIndex > -1) {
        axios
          .put(`http://localhost:3000/jobs/${item.id}`, {
            id: this.editedItem.id,
            title: this.editedItem.title,
            company: this.editedItem.company,
            contact: this.editedItem.contact,
            status: this.editedItem.status,
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
      else {
        axios
          .post(`http://localhost:3000/jobs/`, {
            job: this.editedItem
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
      const index = this.jobs.indexOf(item);
      confirm("Are you sure you want to delete this item?"); 
      axios
        .delete(`http://localhost:3000/jobs/${item.id}`)
        .then(response => {
          console.log(response);
          console.log(response.data.json);
          alert(response.data.json);
          this.initialize();
        })
        .catch(error => {
          console.log(error);
        });
        this.jobs.splice(index, 1);
    },
  
    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({});
        this.editedIndex = -1;
      }, 300);
    }
  }
};
</script>