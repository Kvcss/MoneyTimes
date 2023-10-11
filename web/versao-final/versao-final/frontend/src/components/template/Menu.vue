<template>
    <aside class="menu">
        <div class="menu-filter">
            <b-card class="b5">
                <h4 class="mb-0">Menu:</h4>
                <b-list-group class="teste" flush>
                    <b-list-group-item class="wrapper"  href="/"><span>Área Principal</span></b-list-group-item>
                    <b-list-group-item class="wrapper"  href="/spending"><span>Todas as compras</span></b-list-group-item>
                    <b-list-group-item class="wrapper" href="/report"><span>Relatório de gastos</span></b-list-group-item>
                    <b-list-group-item class="wrapper" href="/perfil"><span>Meus dados</span></b-list-group-item>
                </b-list-group>
            </b-card>
        </div>
    </aside>
</template>

<script>

export default {
    name: 'Menu',
    data: function () {
        return {
        }
    }
}
</script>

<style>
.menu {
    grid-area: menu;
    background: linear-gradient(to right, #232526, #3c3e41);
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
}

.menu .menu-filter {
    display: flex;
    justify-content: center;
    align-items: center;
}

.b5 {
    margin-top: 20px;
    height: 320px;
    align-items: center; 
}

.mb-0 {
    padding: 10px;
    width: 220px;
}

.teste {
    padding: 40px;
    display: flex;
    justify-content: center;
}

a span{
  position: relative;
  z-index: 2;
  color: #000;
}

a span:hover{
  position: relative;
  z-index: 2;
  color: #fff;
}

.wrapper{
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color:#000;
}

.wrapper a{
  display: block;
  width: 200px;
  height: 40px;
  line-height: 40px;
  font-size: 18px;
  font-family: sans-serif;
  text-decoration: none;

  color: #000;
  border: 2px solid #000;
  letter-spacing: 2px;
  text-align: center;
  position: relative;
  transition: all .35s;
}

.wrapper a:after{
  color: #fff!important;
}

.wrapper span{
  position: relative;
  z-index: 2;
}

.wrapper:after{
  position: absolute;
  content: "";
  top: 0;
  left: 0;
  width: 0;
  height: 100%;
  background: #5DBB48;
  transition: all .35s;
}

.wrapper:hover{
  color: #fff;
}

.wrapper:hover:after{
  width: 100%;
}
</style>
