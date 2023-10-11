import Vue from 'vue'
import VueApexCharts from 'vue-apexcharts'

Vue.component('apexchart', VueApexCharts)

export const userKey = '__knowledge_user'
export const baseApiUrl = 'https://rest-api-moneytime.herokuapp.com'

export function showError(e) {
    if(e && e.response && e.response.data) {
        Vue.toasted.global.defaultError()
    }
}

export default { baseApiUrl, showError, userKey }