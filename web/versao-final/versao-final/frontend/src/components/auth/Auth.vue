<template>
    <div class="auth-content">
        <div class="auth-logo">
            <img src="@/assets/logobg.png" width="400" alt="Logo" />
        </div>
        <div class="auth-global">

            <div class="auth-modal auth-modal-text">
                <img src="@/assets/textauth.png" width="200" alt="Logo" />
            </div>

            <div class="auth-modal">
                <input v-model="users.email" name="email" type="text" placeholder="E-mail">
                <input v-model="users.password" name="password" type="password" placeholder="Senha">

                <button @click="signin">Entrar</button>
            </div>
        </div>
    </div>
</template>


<script>
import axios from 'axios'
import { baseApiUrl, showError, userKey } from '@/global'

export default {
    name: 'Auth',
    data() {
        return {
            dismissSecs: 5,
            dismissCountDown: 0,
            users: {
                email: '',
                password: '',
            }
        };
    },

    methods: {
         signin() {
            axios.post(`${baseApiUrl}/auth/login`, this.users)
                .then((res) => {
                    if (res.data.msg == "Logado com sucesso") {
                        this.$store.commit('setUser', res.data)
                        localStorage.setItem(userKey, JSON.stringify(res.data))
                        this.$router.push({ path: '/' })
                    }
                })
                .catch((e)=>{
                    showError(e);
                });
        }
    }
}


</script>

<style>
.auth-global {
    display: flex;
    justify-content: center;
    align-items: center;
}

.auth-logo {
    display: flex;
    justify-content: center;
    align-items: center;
}

.auth-content {
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.auth-modal {
    width: 350px;
    padding: 35px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.auth-modal-text {
    width: 200px;
    margin-top: -60px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.auth-title {
    font-size: 1.2rem;
    font-weight: 100;
    margin-top: 10px;
    margin-bottom: 15px;
}

.auth-modal input {
    border: 1px solid #BBB;
    width: 100%;
    margin-bottom: 15px;
    padding: 6px 8px;
    outline: none;
    border-radius: 5px;
}

.auth-modal button {
    align-self: center;
    background-color: #5DBB48;
    padding: 9px 115px;
    border-radius: 10px;
    border: solid #5DBB48;
    color: #FFFFFF;
}

.auth-modal a {
    margin-top: 35px;
}

.auth-modal hr {
    border: 0;
    width: 100%;
    height: 1px;
    background-image: linear-gradient(to right,
            rgba(120, 120, 120, 0),
            rgba(120, 120, 120, 0.75),
            rgba(120, 120, 120, 0));
}
</style>
