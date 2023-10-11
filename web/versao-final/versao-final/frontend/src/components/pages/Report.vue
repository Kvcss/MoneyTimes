<template>
    <div class="Report">
        <div>
            <b-card header="Relatório" header-tag="header" footer="" title="Todas as compras:">
                <p> Confira seus gastos mensais.</p>
                <apexchart width="650" type="bar" :options="options" :series="series">
                </apexchart>
                <div>
                    <button class="button-29" @click="updateChart">Mostrar dados!</button>
                </div>
            </b-card>
        </div>
    </div>

</template>


<script>

import { baseApiUrl, userKey } from "@/global"
import axios from 'axios'

let datat = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
axios.get(`${baseApiUrl}/getGastos`).then(res => {
    const json = localStorage.getItem(userKey)
    const userData = JSON.parse(json)
    res.data.forEach(element => {
        if (element.id == userData._id) {
            var dateElement = element.date;
            dateElement = dateElement.split("/");
            switch (dateElement[1]) {
                case "01":
                    datat[0] = datat[0] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "02":
                    datat[1] = datat[1] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "03":
                    datat[2] = datat[2] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "04":
                    datat[3] = datat[3] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "05":
                    datat[4] = datat[4] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "06":
                    datat[5] = datat[5] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "07":
                    datat[6] = datat[6] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "08":
                    datat[7] = datat[7] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "09":
                    datat[8] = datat[8] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "10":
                    datat[9] = datat[9] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "11":
                    datat[10] = datat[10] + parseFloat(element.value.replace(',', '.'));
                    break;
                case "12":
                    datat[11] = datat[11] + parseFloat(element.value.replace(',', '.'));
                    break;
            }
        }
    });
});

export default {
    name: 'Report',
    data: function () {
        return {
            options: {
                chart: {
                    id: 'vuechart-example'
                },
                xaxis: {
                    categories: [
                        "Jan",
                        "Fev",
                        "Mar",
                        "Abr",
                        "Mai",
                        "Jun",
                        "Jul",
                        "Ago",
                        "Set",
                        "Out",
                        "Nov",
                        "Dez"
                    ]
                }
            },
            series: [{
                name: 'Mês',
                data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            }]
        }
    },
    methods: {
        updateChart() {
            let newData = this.series[0].data = datat;
            this.series = [{
                data: newData
            }]
        }
    }
}


</script>

<style>
.button-29 {
  align-items: center;
  margin-left: 270px;
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
