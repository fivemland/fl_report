<script>
  import { formatUNIX } from '../utils.js';
  import { myUser } from '../stores.js';

  export let sender;
  export let time;
  $: myMessage = sender ? sender == $myUser.identifier : false;
  $: formatedTime = formatUNIX(time || 0);
</script>

<div class={`w-full flex ${myMessage ? 'justify-end' : ''}`}>
  <div class="tooltip tooltip-bottom" data-tip={formatedTime}>
    <div class={`p-2 m-2 ${myMessage ? 'bg-info text-slate-700 rounded-l-xl rounded-tr-xl' : 'bg-base-100 rounded-r-xl rounded-tl-xl'}`}>
      <slot />
    </div>
  </div>
</div>
