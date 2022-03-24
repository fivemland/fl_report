<script>
  let users = [
    { name: 'Clark Melton', steam: 'Csoki', online: true },
    { name: 'Orbán Viktor', online: false },
    { name: 'Ádám', online: false },
  ];

  let search = '';

  $: filteredUsers = users.filter((user) => {
    return user.name.toLowerCase().includes(search.toLowerCase());
  });

  function selectUser(user) {
    console.log(user);
  }
</script>

<main class="w-2/6 bg-slate-700 rounded-xl mr-2 p-1">
  <div class="form-control mb-2">
    <input bind:value={search} type="text" placeholder="Search..." class="input input-bordered input-sm bg-slate-800" maxlength="45" />
  </div>

  {#if search.length > 0 && filteredUsers.length <= 0}
    <div class="text-center mt-5">
      No result for:
      <br />
      <span class="italic">
        {search}
      </span>
    </div>
  {/if}

  {#each filteredUsers as user}
    <div on:click={selectUser(user)} class="h-16 p-1 btn bg-slate-900 w-full justify-between mb-2">
      <div>
        {user.name}
        <br />
        <div class="italic text-xs">{user.steam ?? 'Unknown'}</div>
      </div>

      <div class="flex items-center">
        <div class={`rounded-full border border-gray-900 ${user.online ? 'bg-green-600 w-3 h-3 mr-1' : 'bg-red-600 w-3 h-3 mr-1'}`} />
        {user.online ? 'Online' : 'Offline'}
      </div>
    </div>
  {/each}
</main>
