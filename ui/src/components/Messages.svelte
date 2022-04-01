<script>
  import { afterUpdate } from 'svelte';

  import Message from './Message.svelte';
  import { selectedUser } from '../stores.js';

  let div;

  afterUpdate(() => {
    div.scrollTo(0, div.scrollHeight);
  });

  $: computedMessages = $selectedUser.messages || [];
</script>

<div bind:this={div} id="messages" class="overflow-hidden overflow-y-auto">
  {#if !computedMessages || computedMessages.length <= 0}
    <div class="text-red-500 text-xl italic font-light text-center mt-5">No messages or errors while loading</div>
  {:else}
    {#each computedMessages as message}
      <Message sender={message.sender} time={message.time}>
        {message.text}
      </Message>
    {/each}
  {/if}
</div>

<style>
  #messages {
    height: 36rem;
  }
</style>
