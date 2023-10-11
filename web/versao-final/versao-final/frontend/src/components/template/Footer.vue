<template>
    <footer class="footer">
        <span>Copyright <strong>MoneyTimes</strong> © 2022</span>
    </footer>
</template>

<script>
export default {
    name: "Footer"
}
</script>

<style>
    .footer {
        grid-area: footer;
        background-color: #322C2C;
        color: #FFF;

        display: flex;
        align-items: center;
        justify-content: flex-end;
        padding-right: 10px;
    }
</style>
