<template>
    <div class="home">
        <div>

            <b-card header="Perfil do Usuário:" header-tag="header" footer="" title="Seu Perfil:">


                <b-form>
                    <input id="user-id" type="hidden" v-model="user.id" />
                    <b-row>
                        <b-col md="6" sm="12">
                            <b-form-group label="Nome:" label-for="user-name">
                                <b-form-input readonly id="user-name" type="text" v-model="user.name" required />
                            </b-form-group>
                        </b-col>
                        <b-col md="6" sm="12">
                            <b-form-group label="E-mail:" label-for="user-email">
                                <b-form-input readonly id="user-email" type="text" v-model="user.email" required />
                            </b-form-group>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col md="6" sm="12">
                            <b-form-group label="Salário:" label-for="user-salary">
                                <b-form-input readonly id="user-salary" type="text" v-model="user.salary" required />
                            </b-form-group>
                        </b-col>
                    </b-row>
                </b-form>



            </b-card>
        </div>
    </div>

</template>

<script>
//import PageTitle from '../template/PageTitle'

import { baseApiUrl, userKey } from "@/global"
import axios from 'axios'
export default {
    name: 'Perfil',
    data: function () {
        return {
            user: {},
            users: [],
            fields: [
                { key: '_id', label: 'Código', sortable: true },
                { key: 'name', label: 'Nome', sortable: true },
                { key: 'email', label: 'E-mail', sortable: true },
                { key: 'salary', label: 'Salário', sortable: true }
            ]
        }
    },
    methods: {
        async loadUsers() {
            const json = localStorage.getItem(userKey)
            const userData = JSON.parse(json)

            axios.get(`${baseApiUrl}/user/${userData._id}`, userData).then(res => {
                this.user = res.data
            })
        }
    },
    mounted() {
        this.loadUsers()
    }
}
</script>

<style>

</style>
