<template>
    <div>
      <h2>Contact Us</h2>
      <form @submit.prevent="submitForm">
        <label for="name">Name:</label>
        <input type="text" id="name" v-model="formData.name" required />
  
        <label for="email">Email:</label>
        <input type="email" id="email" v-model="formData.email" required />
  
        <label for="message">Message:</label>
        <textarea id="message" v-model="formData.message" required></textarea>
  
        <button type="submit">Submit</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    name: 'HeadlessContact',
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
  