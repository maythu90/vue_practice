<template>
  <div>
  <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <table>
      <tbody>
        <tr>
         <th>ID</th>
         <th>Name</th>
         <th>Department</th>
         <th>Payment</th>
         <th>Address</th>
         <th>Joined Date</th>
        </tr>
        <tr v-for="e in employees" :key="e.id">
         <td><router-link :to="{ name: 'EmployeeDetail', params: { id: e.id } }">{{ e.id }}</router-link></td>
         <td>{{ e.name }}</td>
         <td>{{ e.department }}</td>
         <td>{{ e.payment }}</td>
         <td>{{ e.address }}</td>
         <td>{{ e.joined_date }}</td>
         <td>
          <button @click="deleteTarget = e.id; showModal = true">Delete
          </button>
         </td>
        </tr>
      </tbody>
    </table>
    <modal v-if="showModal" @cancel="showModal = false" @ok="deleteEmployee(); showModal = false;">
      <div slot="body">Are you sure?</div>
    </modal>
  </div>
</template>

<script>
import axios from 'axios';

import Modal from 'Modal.vue'

export default {
  components: {
   Modal
  },
  data: function () {
    return {
      employees: [],
      showModal: false,
      deleteTarget: -1,
      errors: ''
    }
  },
  mounted () {
   this.updateEmployees();
  },
  methods: {
   deleteEmployee: function(){
      if(this.deleteTarget <= 0){
         console.warn('deleteTarget should be greater than zero.');
         return;
      }

      axios
       .delete(`/api/v1/employees/${this.deleteTarget}`)
       .then(response => {
          this.deleteTarget = -1;
          this.updateEmployees();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
   },
   updateEmployees: function() {
      axios
       .get('/api/v1/employees.json')
       .then(response => (this.employees = response.data))
   }

  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

table{
  width: 100%;
}

table tr:hover {background-color: #ddd;}

table th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

table td, table th {
  border: 1px solid #ddd;
  padding: 8px;
}
</style>
