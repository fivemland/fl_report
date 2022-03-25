<script>
  import { selectedUser } from '../stores';

  function requestUserData() {
    console.log($selectedUser);
  }
</script>

<main class="m-1 p-1 px-2 rounded-md bg-base-100 text-gray-400 flex justify-between items-center">
  <div>
    <div class="text-2xl">
      <i class="fa-solid fa-user" />
      {$selectedUser.charName}
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
        <i class="fa-solid fa-skull-crossbones" />
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
        <label for="user-information-modal" class="text-xl text-error absolute right-3 top-2">
          <i class="fa-solid fa-xmark" />
        </label>
        <h3 class="text-lg font-bold">
          Player informations <span class="block font-thin italic">{$selectedUser.charName || 'Unknown'}</span>
        </h3>
        <div class="pt-3 flex justify-center">
          <table class="table table-zebra table-compact w-full">
            <tbody>
              <tr>
                <td>Identifier</td>
                <td class="text-right">{$selectedUser.identifier}</td>
              </tr>
              <tr>
                <td>Money</td>
                <td class="text-right">{'0 TODO!'}</td>
              </tr>
              <tr>
                <td>Dirty Money</td>
                <td class="text-right">{'0 TODO!'}</td>
              </tr>
              <tr>
                <td>Job</td>
                <td class="text-right">{'Police TODO!'}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</main>
