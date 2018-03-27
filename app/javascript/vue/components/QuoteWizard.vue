<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header">Quote Wizard</div>

                    <div class="card-body">
                        I'm an example component.
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
  import axios from 'axios';
  export default {
    mounted: function() {
        console.log('Quote Wizard mounted.')
    },
    data: function() {
      return {
        users: [{ email: "foo" }],
      }
    },
    methods: {
    }
  }
</script>