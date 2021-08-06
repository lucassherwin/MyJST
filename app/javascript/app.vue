<template>
  <div id="app">
    <v-app>
      <v-toolbar flat color="white">
        <router-link to='/jobs'><v-toolbar-title >MyJST</v-toolbar-title></router-link>
        <v-divider class="mx-4" inset vertical></v-divider>
        <router-link to="/tasks"><v-toolbar-title>MyToDo</v-toolbar-title></router-link>
      </v-toolbar>
      <router-view></router-view>
    </v-app>
  </div>
</template>

<script>
import job from "./packs/components/job.vue";
import task from "./packs/components/task.vue";

export default {
  data: function() {
    return {
      message: "MyJST"
    };
  },
  components: {
    job: job,
    task: task
  },
  methods: {
    handleClick: function() {
      console.log('click');
    }
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

a {
  color: black;
  text-decoration: none; /* no underline */
}

</style>