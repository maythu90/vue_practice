<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import EmployeeIndex from 'EmployeeIndex.vue'
import EmployeeDetail from 'EmployeeDetail.vue'
import EmployeeNew from 'EmployeeNew.vue'
import EmployeeEdit from 'EmployeeEdit.vue'

const router = new VueRouter({
  routes: [
    { path: '/',
      component: EmployeeIndex
    },
    { path: '/employees/:id(\\d+)', 
      name: 'EmployeeDetail',
      component: EmployeeDetail
    },
    {
      path: '/employees/new',
      name: 'EmployeeNew',
      component: EmployeeNew
    },
    {
      path: '/employees/:id(\\d+)/edit',
      name: 'EmployeeEdit',
      component: EmployeeEdit
    }

  ]
})

Vue.use(VueRouter)

export default{
  router
}
</script>

<style scoped>

</style>
