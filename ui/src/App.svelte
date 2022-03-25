<script>
  import LeftSide from './components/LeftSide.svelte';
  import Header from './components/Header.svelte';
  import Message from './components/Message.svelte';
  import UserHeader from './components/UserHeader.svelte';

  import { visible, myUser, selectedUser } from './stores.js';
</script>

<main class="w-screen h-screen flex justify-center items-center">
  {#if $visible}
    <div class="bg-slate-800 w-5/6 p-2 rounded-lg">
      <Header />

      <div id="container" class="flex rounded-box">
        <LeftSide />

        <div class="w-full rounded-box">
          <div id="messages" class="mb-3 p-1 rounded-lg bg-slate-700">
            <UserHeader />

            <Message sender={$myUser}>Lorem Ipsum fasz kurva</Message>
            <Message sender={selectedUser}>Másik div nagyon jo</Message>
            <Message sender={selectedUser}>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
              enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
              in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
              proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Message>
          </div>

          <div id="inputs" class="flex items-center">
            <textarea class="h-10 w-full textarea textarea-accent" placeholder="Message" />
            <button class="ml-1 btn btn-accent">
              <i class="fa-solid fa-paper-plane" />
            </button>
          </div>
        </div>
      </div>
    </div>
  {/if}
</main>

<style>
  #container {
    height: 45rem;
  }
  #messages {
    height: 41rem;
    overflow-y: auto;
  }

  textarea {
    resize: none;
  }
</style>
