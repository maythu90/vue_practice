<template>
 <form @submit.prevent="$emit('submit')">
 <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
  </div>
  <div>
    <label>Name</label>
    <input v-model="employee.name" type="text">
  </div>
  <div>
    <label>Department</label>
    <input v-model="employee.department" type="text">
  </div>
  <div>
    <label>Payment</label>
    <input v-model="employee.payment" type="number">
  </div>
  <div>
    <label>Address</label>
    <input v-model="employee.address" type="text">
  </div>
  <div>
    <label>Joined Date</label>
    <input v-model="employee.joined_date" type="date">
  </div>
  <button type="submit" id="btn">Commit</button>
 </form>
</template>

<script>
export default {
  props: {
   employee: {},
   errors: ''
  }
}
</script>

<style>
div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

input[type=text], input[type=number], input[type=date]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

#btn{
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 15px;
}

[type=submit]:hover {
  background-color: green;
}
</style>