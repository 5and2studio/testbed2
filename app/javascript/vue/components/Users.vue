<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header">Users</div>

                    <div class="card-body">
                        <input v-model="user.email"></input>
                        <input v-model="user.first_name"></input>
                        <input v-model="user.last_name"></input>
                        <input v-model="user.password" type="password"></input>
                        <button class="button" style="display:block;margin:auto;" @click="createUser">Create User</button>
                    </div>
                    <div class="card-header">Users</div>
                </div>

                <div class="card card-default">
                    <div class="card-body">
                        <button class="button" style="display:block;margin:auto;" @click="loadUsers">Get Users</button>
                    </div>
                    <div v-for="user in users">
                      <div class="card">
                        <div class="card-divider">{{ user.email }}</div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
  import axios from 'axios';
  export default {
    mounted: function() {
        console.log('Quote Wizard mounted.')
    },
    data: function() {
      return {
        user:   this.newUser(),
        users:  this.loadUsers(),
      }
    },
    methods: {
      newUser: function() {
        axios.get("http://localhost:3003/api/users/new")
          .then(response => {this.user = response.data.user })
      },
      createUser: function() {
        var self = this;
        axios.post("/api/users", this.user)
          .then(self.loadUsers)
      },
      loadUsers: function() {
        axios.get("http://localhost:3003/api/users")
          .then(response => {this.users = response.data.list })
      }
    }
  }
</script>