<template>
  <div id="app">
    <v-app>
      <p>{{ message }}</p>
      <job />
    </v-app>
  </div>
</template>

<script>
import job from "./packs/components/job.vue";
export default {
  data: function() {
    return {
      message: "Hello Vue!"
    };
  },
  components: {
    job: job
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>