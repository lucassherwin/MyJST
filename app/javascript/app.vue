<template>
  <div id="app">
    <v-app>
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
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>