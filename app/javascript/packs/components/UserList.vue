<script lang="ts">
  import axios from "axios"
  import { Vue, Component } from "vue-property-decorator"

  @Component
  export default class UsersList extends Vue {
    users: String[] = []

    async mounted(): Promise<void> {
      await this.fetchUsers();
    }

    async fetchUsers(): Promise<void> {
      await axios.get("/users").then((response) => {
        response.data.map((user: any) => {
          this.users.push(user);
        })
      })
    }
  }
</script>

<template>
  <div id="users-list">
    <h2>users_list</h2>
    <ul>
      <li v-for="user in users" v-bind:key="user.account">
        <div>{{user.account}}</div>
        <div>{{user.name}}</div>
        <div>{{user.email}}</div>
      </li>
    </ul>
  </div>
</template>