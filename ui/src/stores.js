import { writable, derived } from 'svelte/store';

export const visible = writable(true);

export const myUser = writable({
  serverId: 1,
  identifier: '0800fc577294c34e0b28ad2839435945',
  name: 'Csoki',
  charName: 'Clark Melton',
});

export const users = writable([
  {
    charName: 'Clark Melton',
    name: 'Csoki',
    online: true,
    identifier: '0800fc577294c34e0b28ad2839435945',
    messages: [
      {
        dbID: 1,
        sender: '74fe563ea472483c4475c78dfed9348c',
        time: Date.now(),
        text: 'Remélem a Fidesz-KDNP jelöltjeire szavazol vasárnap',
      },
      {
        dbID: 2,
        sender: '0800fc577294c34e0b28ad2839435945',
        time: Date.now(),
        text: 'Persze mire másra, hát a Gyurcsány emberei nem adnak nekeme semmit csak adóztatnának.',
      },
    ],
  },
  { charName: 'Orbán Viktor', online: false, identifier: '74fe563ea472483c4475c78dfed9348c' },
  { charName: 'Ádám', online: false, identifier: '1d7c2923c1684726dc23d2901c4d8157' },
]);

export const selectedId = writable('0800fc577294c34e0b28ad2839435945');

export const selectedUser = derived([users, selectedId], ([$users, $selectedId]) => {
  const filtered = $users.filter((user) => {
    return user.identifier === $selectedId;
  });

  return filtered.length > 0 ? filtered[0] : false;
});
