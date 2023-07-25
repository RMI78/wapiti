<template>
    <div>
      <h2>Log in !</h2>
      <form @submit.prevent="submitForm">
  
        <label for="email">Email:</label>
        <input type="email" id="email" v-model="formData.email" required />
  
        <label for="password">Name:</label>
        <input type="password" id="password" v-model="formData.name" required />
  
        <button type="submit">Submit</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    name: 'HeadlessLogin',
    data() {
      return {
        formData: {
          name: '',
          email: '',
          message: ''
        }
      };
    },
    methods: {
      submitForm() {
        console.log('Form submitted!');
        console.log('Form data:', this.formData);
      }
    }
  };
  </script>
  