<script>
  export let sender = 'me';
</script>

<div class={`w-full flex ${sender == 'me' ? 'justify-end' : ''}`}>
  <div class={`p-2 m-2 ${sender == 'me' ? 'bg-info text-slate-700 rounded-l-lg rounded-tr-lg' : 'bg-base-100 rounded-r-lg rounded-tl-lg'}`}>
    <slot />
  </div>
</div>
