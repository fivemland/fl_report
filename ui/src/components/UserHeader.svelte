<script>
  import { selectedUser } from '../stores';

  let userData;
  let error;

  async function requestUserData() {
    if (!$selectedUser) return;

    const response = await fetch(`https://${GetParentResourceName()}/requestUserData`, {
      method: 'POST',
      body: JSON.stringify({
        identifier: $selectedUser.identifier,
      }),
    });

    const responseJson = await response.json();

    if (responseJson.error) return (error = responseJson.error);

    userData = responseJson.userData;
  }

  function close() {
    userData = null;
    error = null;
  }
</script>

<main class="m-1 p-1 px-2 rounded-md bg-base-100 text-gray-400 flex justify-between items-center">
  <div>
    <div class="text-2xl">
      <i class="fa-solid fa-user" />
      {$selectedUser.charName || 'Unknown'}
      <div class={`badge text-gray-900 ${$selectedUser.online ? 'bg-success' : 'bg-error'}`}>
        {$selectedUser.online ? 'Online' : 'Offline'}
      </div>
    </div>

    <div class="tooltip tooltip-right" data-tip="Steam name">
      <p class="text-md">{$selectedUser.name || 'Unknown'}</p>
    </div>
  </div>
  <div class="w-24 flex flex-wrap justify-center items-center">
    <div class="tooltip tooltip-left" data-tip="Kick player">
      <button class="mt-1 ml-1 btn btn-circle btn-xs btn-error">
        <i class="fa-brands fa-kickstarter-k" />
      </button>
    </div>
    <div class="tooltip tooltip-left" data-tip="Screenshot player view">
      <button class="mt-1 ml-1 btn btn-circle btn-xs btn-secondary">
        <i class="fa-solid fa-desktop" />
      </button>
    </div>
    <div class="tooltip tooltip-left" data-tip="Teleport to player">
      <button class="mt-1 ml-1 btn btn-circle btn-xs btn-primary">
        <i class="fa-solid fa-location-dot" />
      </button>
    </div>

    <div class="tooltip tooltip-left" data-tip="Player Informations">
      <label on:click={requestUserData} for="user-information-modal" class="modal-button mt-1 ml-1 btn btn-circle btn-xs">
        <i class="fa-solid fa-info" />
      </label>
    </div>
    <div class="tooltip tooltip-left" data-tip="Revive">
      <button class="mt-1 ml-1 btn btn-circle btn-xs btn-warning">
        <i class="fa-solid fa-hand-holding-medical" />
      </button>
    </div>

    <div class="tooltip tooltip-left" data-tip="Delete conversation">
      <button class="mt-1 ml-1 btn btn-circle btn-xs btn-error">
        <i class="fa-solid fa-trash" />
      </button>
    </div>

    <!-- Player information Modal -->
    <input type="checkbox" id="user-information-modal" class="modal-toggle" />
    <div class="modal">
      <div class="modal-box relative bg-gray-700">
        <label on:click={close} for="user-information-modal" class="text-xl text-error absolute right-3 top-2 cursor-pointer">
          <i class="fa-solid fa-xmark" />
        </label>
        <h3 class="text-lg font-bold">
          Player informations <span class="block font-thin italic">{$selectedUser.charName || 'Unknown'}</span>
        </h3>
        <div class="pt-3 flex justify-center">
          {#if error}
            <div class="alert alert-error shadow-lg">
              <div>
                <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current flex-shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"
                  />
                </svg>
                <span>{error}</span>
              </div>
            </div>
          {:else if userData}
            <table class="table table-zebra table-compact w-full">
              <tbody>
                {#each userData as data}
                  <tr>
                    <td>{data[0]}</td>
                    <td class="text-right">{data[1]}</td>
                  </tr>
                {/each}
              </tbody>
            </table>
          {/if}
        </div>
      </div>
    </div>
  </div>
</main>
