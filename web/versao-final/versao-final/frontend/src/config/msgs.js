import Vue from 'vue'
import Toasted from 'vue-toasted'

Vue.use(Toasted, {
    iconPack: 'fontawesome',
    duration: 3000
})

Vue.toasted.register(
    'defaultError',
    payload => !payload.msg ? 'Email/Senha invalida.<br> Tente novamente...' : payload.msg,
    { type : 'error', icon : 'times' }
)