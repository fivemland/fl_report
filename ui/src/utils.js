export function formatUNIX(timestamp) {
  const date = new Date(timestamp);

  const month = date.getMonth() + 1;
  const days = date.getDate();

  const hours = date.getHours();
  const minutes = date.getMinutes();

  return `${date.getFullYear()}-${month < 10 ? '0' + month : month}-${days < 10 ? '0' + days : days} ${hours < 10 ? '0' + hours : hours}:${
    minutes < 10 ? '0' + minutes : minutes
  }`;
}
