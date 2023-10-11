<template>
    <div class="home">
            <div>

    <b-card header="Compras:"
      header-tag="header"
      footer=""
      title="Todas as compras:"
    >
    <p>Confira todas as compras cadastradas no aplicativo</p>
    <b-table hover striped :items="gastos" :fields="fields">
        </b-table>
    </b-card>
</div>
    </div>
    
</template>

<script>


import { baseApiUrl } from '@/global'
import axios from 'axios'
export default {
    name: 'Spending',
    data: function() {
        return {
            gasto: {},
            gastos: [],
            fields: [
                { key: 'category', label: 'Categoria', sortable: true },
                { key: 'date', label: 'Data', sortable: true },
                { key: 'value', label: 'Preço', sortable: true }
            ]
        }
    },
    methods: {
        loadGastos() {
            axios.get(`${baseApiUrl}/getGastos`).then(res => {
                this.gastos = res.data
            })
        }
    },
    mounted() {
        this.loadGastos()
    }
}
</script>

<style>
</style>
