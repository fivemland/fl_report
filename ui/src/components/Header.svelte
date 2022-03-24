<script>
  export let close;
</script>

<div class="mb-2 rounded-lg text-xl p-1 px-2">
  <span>Reports</span>

  <button on:click={close} class="float-right text-error">
    <i class="fa-solid fa-xmark" />
  </button>
</div>
