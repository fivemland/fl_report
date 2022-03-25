<script>
  import { myUser } from '../stores.js';

  export let sender;
  $: myMessage = sender ? sender.identifier == $myUser.identifier : false;
</script>

<div class={`w-full flex ${myMessage ? 'justify-end' : ''}`}>
  <div class={`p-2 m-2 ${myMessage ? 'bg-info text-slate-700 rounded-l-xl rounded-tr-xl' : 'bg-base-100 rounded-r-xl rounded-tl-xl'}`}>
    <slot />
  </div>
</div>
