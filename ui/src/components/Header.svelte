<script>
  import { visible, updateVisible } from '../stores';

  function close() {
    updateVisible(!$visible);
  }
</script>

<div class="mb-2 rounded-lg text-xl p-1 px-2">
  <span>
    <i class="fa-solid fa-ticket" />
    Reports</span
  >

  <button on:click={close} class="float-right text-error">
    <i class="fa-solid fa-xmark" />
  </button>
</div>
