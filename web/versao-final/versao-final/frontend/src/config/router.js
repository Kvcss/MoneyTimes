import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '@/components/home/Home'
import Auth from '@/components/auth/Auth'
import Gastos from '@/components/pages/Spending'
import Perfil from '@/components/pages/Perfil'
import Report from '@/components/pages/Report'

import { userKey } from '@/global'

Vue.use(VueRouter)

const routes = [{
    name: 'home',
    path: '/',
    component: Home
}, {
    name: 'auth',
    path: '/auth',
    component: Auth
}, {
    name: 'spending',
    path: '/Spending',
    component: Gastos
}, {
    name: 'perfil',
    path: '/Perfil',
    component: Perfil
}, {
    name: 'report',
    path: '/Report',
    component: Report
}]

const router = new VueRouter({
    mode: 'history',
    routes
})

router.beforeEach((to, from, next) => {
    const json = localStorage.getItem(userKey)

    if(to.matched.some(record => record.meta.requiresAdmin)) {
        const user = JSON.parse(json)
        user ? next() : next({ path: '/' })
    } else {
        next()
    }
})

export default router
