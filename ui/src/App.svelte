<script>
  import LeftSide from './components/LeftSide.svelte';
  import Header from './components/Header.svelte';
  import Messages from './components/Messages.svelte';
  import UserHeader from './components/UserHeader.svelte';

  import { visible, myUser, selectedId, users } from './stores.js';

  const FLOOD_TIME = 250;

  let messageText = '';
  let inputsDisabled = false;

  function textareaKeydown(event) {
    const { key, shiftKey } = event;

    if (key === 'Enter' && !shiftKey) {
      sendMessage();
      event.preventDefault();
    }
  }

  function sendMessage() {
    if (inputsDisabled || messageText.length <= 0) return;

    const newUsers = $users.map((user) => {
      if (user.identifier === $selectedId) {
        console.log(user);
        if (!user.messages) user.messages = [];

        user.messages.push({
          dbID: 1,
          sender: $myUser.identifier,
          time: Date.now(),
          text: messageText,
        });
      }
      return user;
    });

    users.set(newUsers);

    messageText = '';
    inputsDisabled = true;
    setTimeout(() => {
      if (inputsDisabled) inputsDisabled = false;
    }, FLOOD_TIME);

    console.log('sendMessage()', messageText);
  }
</script>

<main class="w-screen h-screen flex justify-center items-center">
  {#if $visible}
    <div class="bg-slate-800 w-5/6 p-2 rounded-lg">
      <Header />

      <div id="container" class="flex rounded-box">
        <LeftSide />

        <div class="w-full rounded-box">
          <div id="rightside" class="mb-3 p-1 rounded-lg bg-slate-700">
            <UserHeader />

            <Messages />
          </div>

          <div id="inputs" class="flex items-center">
            <textarea
              on:keydown={textareaKeydown}
              bind:value={messageText}
              disabled={inputsDisabled}
              class="h-10 w-full textarea textarea-accent"
              placeholder="Message"
            />
            <button on:click={sendMessage} disabled={!messageText || messageText.length <= 0 || inputsDisabled} class="ml-1 btn btn-accent">
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

  #rightside {
    height: 41rem;
  }

  textarea {
    resize: none;
  }
</style>
