import { createRouter, createWebHistory } from 'vue-router'
import HeadlessHome from '../components/HeadlessHome'
import HeadlessServices from '../components/HeadlessServices'
import HeadlessContact from '../components/HeadlessContact'
import HeadlessAbout from '../components/HeadlessAbout'
import HeadlessLogin from '../components/HeadlessLogin'
//createMemoryHistory,

const routes = [
  {
    path: '/',
    name: 'home',
    component: HeadlessHome
  },
  {
    path: '/about',
    name: 'about',
    component: HeadlessAbout
  },
  {
    path: '/services',
    name: 'services',
    component: HeadlessServices
  },
  {
    path: '/contact',
    name: 'contact',
    component: HeadlessContact
  },
  {
    path: '/login',
    name: 'login',
    component: HeadlessLogin
  }
]

//choosing the type of history
const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
