<script>
  import { myUser, users, selectedUser, selectedId } from '../stores.js';

  let search = '';

  $: filteredUsers = $users.filter((user) => {
    return (
      (user.name && user.name.toLowerCase().includes(search.toLowerCase())) || user.charName.toLowerCase().includes(search.toLowerCase())
    );
  });

  function selectUser(user) {
    if (!user.identifier) return;

    selectedId.set(user.identifier);
  }
</script>

<main class="w-2/6 mr-2">
  <div class="form-control mb-2">
    <input bind:value={search} type="text" placeholder="Search..." class="input input-bordered input-sm bg-slate-700" maxlength="35" />
  </div>

  <div id="userlist" class="bg-slate-700 rounded-xl p-1 overflow-y-auto">
    {#if search.length > 0 && filteredUsers.length <= 0}
      <div class="text-center mt-2">
        No result for:
        <br />
        <span class="italic">
          {search}
        </span>
      </div>
    {/if}

    {#each filteredUsers as user}
      <div
        on:click={selectUser(user)}
        class={`h-16 p-1 btn bg-slate-900 w-full justify-between mb-2
          ${
            $selectedUser.identifier === user.identifier ? `border-2 ${$selectedUser.online ? 'border-success' : 'border-error'}` : 'asdasd'
          }`}
      >
        <div>
          {user.charName ?? 'Unknown'}
          <br />
          <div class="italic text-xs">{user.name ?? 'Unknown'}</div>
        </div>

        <div class="flex items-center">
          <div class={`rounded-full border border-gray-900 ${user.online ? 'bg-success w-3 h-3 mr-1' : 'bg-error w-3 h-3 mr-1'}`} />
          {user.online ? 'Online' : 'Offline'}
        </div>
      </div>
    {/each}
  </div>
</main>

<style>
  #userlist {
    height: 94%;
  }
</style>
