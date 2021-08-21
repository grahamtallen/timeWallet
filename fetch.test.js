await fetch("http://localhost:8545/", {
  credentials: "omit",
  headers: {
    "User-Agent":
      "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0",
    Accept: "*/*",
    "Accept-Language": "en-US,en;q=0.5",
    "content-type": "application/json",
  },
  referrer: "http://localhost:3000/",
  body: '{"method":"eth_accounts","params":[],"id":202,"jsonrpc":"2.0"}',
  method: "POST",
  mode: "cors",
});
process.exit();
