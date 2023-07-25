<template>
    <div>
      <h1>Welcome to Realistic Vue.js Website</h1>
  
      <div>
        <div v-for="image in images" :key="image.id">
          <img :src="image.url" :alt="image.alt" />
          <p>{{ image.description }}</p>
        </div>
      </div>
  
      <button @click="handleClick">Click me!</button>
  
      <router-view></router-view>
    </div>
  </template>
  
  <script>
  export default {
    name: 'HeadlessHome',
    data() {
      return {
        images: [
          {
            id: 1,
            url: 'https://example.com/image1.jpg',
            alt: 'Image 1',
            description: 'This is the first image description.'
          },
          {
            id: 2,
            url: 'https://example.com/image2.jpg',
            alt: 'Image 2',
            description: 'This is the second image description.'
          },
          {
            id: 3,
            url: 'https://example.com/image3.jpg',
            alt: 'Image 3',
            description: 'This is the third image description.'
          }
        ]
      };
    },
    methods: {
      handleClick() {
        window.location="/contact"
        console.log('Button clicked!');
      }
    }
  };
  </script>
  