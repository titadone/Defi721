
module.exports = {
  networks: {
    ganache:{
      host:"127.0.0.1",
      port:7545,
      network_id:"5777"
    }
  },
  solc:{
    optimizer:{
      enabled: true,
      runs: 200
    }
  }
}
/*
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
      // version: "0.5.1",    // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      // settings: {          // See the solidity docs for advice about optimization and evmVersion
        optimizer: {
          enabled: false,
          runs: 200
        },
      //  evmVersion: "byzantium"
      // }
    }
  }
}
*/