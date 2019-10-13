<template>
 <employee-form-pane :errors="errors" :employee="employee" @submit="createEmployee"></employee-form-pane>
</template>

<script>
import axios from 'axios';

import EmployeeFormPane from 'EmployeeFormPane.vue';

export default{
  components: {
    EmployeeFormPane
  },
	data: function () {
      return {
        employee: {
          name: '',
          department: '',
          payment: '',
          address: '',
          joined_date: ''
        },
        errors: ''
      }
	},
	methods: {
    createEmployee: function() {
      axios
        .post('/api/v1/employees', this.employee)
        .then(response => {
          let e = response.data;
          this.$router.push({ name: 'EmployeeDetail', params: { id: e.id } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}

</script>

<style scopped>
</style>