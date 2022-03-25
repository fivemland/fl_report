import { writable } from 'svelte/store';

export const visible = writable(true);

export const myUser = writable({
  serverId: 1,
  identifier: '0800fc577294c34e0b28ad2839435945',
  name: 'Csoki',
  charName: 'Clark Melton',
});

export const users = writable([
  { charName: 'Clark Melton', name: 'Csoki', online: true, identifier: '0800fc577294c34e0b28ad2839435945' },
  { charName: 'Orbán Viktor', online: false, identifier: '74fe563ea472483c4475c78dfed9348c' },
  { charName: 'Ádám', online: false, identifier: '1d7c2923c1684726dc23d2901c4d8157' },
]);

export const selectedUser = writable({ charName: 'Ádám', online: false, identifier: '1d7c2923c1684726dc23d2901c4d8157' });
