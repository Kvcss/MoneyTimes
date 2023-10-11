<template>
    <div class="home">
        <PageTitle icon="fa fa-home" main="Área Principal" sub="Bem vindo ao MoneyTimes" />
        <div>
            <b-card header="Gastos por categorias" header-tag="header" footer="" title="Controle de Gastos:">
                <p>Confira seu maior gasto por categoria <b>anual</b>.</p>
                <apexchart width="550" type="bar" :options="options" :series="series">
                </apexchart>
                <div>
                    <button class="button-30" @click="updateChart">Mostrar dados!</button>
                </div>
            </b-card>
        </div>
    </div>

</template>

<script>
import PageTitle from '../template/PageTitle'
import { baseApiUrl, userKey } from "@/global"
import axios from 'axios'

let dataCategorias = [0, 0, 0, 0, 0, 0];
axios.get(`${baseApiUrl}/getGastos`).then(res => {
    const json = localStorage.getItem(userKey)
    const userData = JSON.parse(json)
    res.data.forEach(element => {
        if (element.id == userData._id) {
            //Gasto por Categoria 
            switch (element.category) {
                case "Alimentação": //Pos 1
                    dataCategorias[0] += parseFloat(element.value.replace(',', '.'));
                    break;
                case "Lazer": //Pos 2
                    dataCategorias[1] += parseFloat(element.value.replace(',', '.'));
                    break;
                case "Saúde": //Pos 3
                    dataCategorias[2] += parseFloat(element.value.replace(',', '.'));
                    break;
                case "Investimento": //Pos 4
                    dataCategorias[3] += parseFloat(element.value.replace(',', '.'));
                    break;
                case "Casa": //Pos 5
                    dataCategorias[4] += parseFloat(element.value.replace(',', '.'));
                    break;
                case "Outros": //Pos 6
                    dataCategorias[5] += parseFloat(element.value.replace(',', '.'));
                    break;
            }
        }
    });

});

export default {
    name: 'Home',
    components: { PageTitle },
    data: function () {
        return {
            options: {
                chart: {
                    id: 'vuechart-example'
                },
                xaxis: {
                    categories: [
                        "Alimentação",
                        "Lazer",
                        "Saúde",
                        "Investimento",
                        "Casa",
                        "Outros "
                    ]
                }
            },
            series: [{
                name: 'Valor R$',
                data: [0, 0, 0, 0, 0, 0]
            }]
        }
    },
    methods: {
        updateChart() {
            let newData = this.series[0].data = dataCategorias;
            this.series = [{
                data: newData
            }]
        }
    }
}
</script>

<style>
.button-30 {
  align-items: center;
  margin-left: 200px;
  appearance: none;
  background-image: radial-gradient(100% 100% at 100% 0, #4c8cc1 0, #24a3fb 100%);
  border: 0;
  border-radius: 6px;
  box-shadow: #03090e 0 2px 4px,#2d23424d 0 7px 13px -3px,#3a416f80 0 -3px 0 inset;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  display: inline-flex;
  font-family: "JetBrains Mono",monospace;
  height: 48px;
  justify-content: center;
  line-height: 1;
  list-style: none;
  overflow: hidden;
  padding-left: 16px;
  padding-right: 16px;
  position: relative;
  text-align: left;
  text-decoration: none;
  transition: box-shadow .15s,transform .15s;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  white-space: nowrap;
  will-change: box-shadow,transform;
  font-size: 18px;
}

.button-29:focus {
  box-shadow: #24a3fb 0 0 0 1.5px inset, rgba(45, 35, 66, .4) 0 2px 4px, rgba(45, 35, 66, .3) 0 7px 13px -3px, #1d7bbe 0 -3px 0 inset;
}

.button-29:hover {
  box-shadow: rgba(45, 35, 66, .4) 0 4px 8px, rgba(45, 35, 66, .3) 0 7px 13px -3px, #104063 0 -3px 0 inset;
  transform: translateY(-2px);
}

.button-29:active {
  box-shadow: #24a3fb 0 3px 7px inset;
  transform: translateY(2px);
}
</style>
