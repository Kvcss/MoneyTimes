<template>

    <header class="subheader">
        <div class="intro">
            <p>Olá,  <b>{{ user.name }}</b>
            <br>
            Salário mensal:
            <br>
            <b>R$: {{ user.salary }}</b> </p>
        </div>

        <div class="cardzin">

            <b-card>
                    Através do <b>"Relatório de Gastos"</b> você
                    pode conferir seus gastos mensais.
            </b-card>
        </div>
    </header>
</template>

<script>
import { userKey } from '@/global'
import { mapState } from 'vuex'

export default {
    name: 'Subheader',
    computed: mapState(['user']),
    methods: {
        logout() {
            localStorage.removeItem(userKey)
            this.$store.commit('setUser', null)
            this.$router.push({ name: 'auth' })
            this.$router.push({ salary: 'auth' })
        }
    }
}
</script>

<style>
.subheader {
    grid-area: subheader;
    background-color: #38a37f;
    display: flex;
    align-items: center;
}

.intro {
    margin-top: 20px;
    margin-left: 50px;
    color: white;
}

.cardzin {
    margin-left: 140px;
}
</style>
