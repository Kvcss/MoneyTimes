<template>
    <div class="page-title">
        <h1><i v-if="icon" :class="icon"></i> {{ main }}</h1>
        <h2>{{ sub }}</h2>
        <hr>
    </div>
</template>

<script>
export default {
    name: 'PageTitle',
    props: ['icon', 'main', 'sub']
}
</script>

<style>
    .page-title h1 {
        margin: 0px;
        color: rgb(233, 231, 231);
    }

    .page-title h2 {
        color: rgb(156, 153, 153);
        margin-top: 1px;
        font-size: 1.2rem;
    }
</style>
