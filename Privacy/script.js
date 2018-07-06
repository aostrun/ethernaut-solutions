const Web3 = require('web3');
let address = "<instance contract address>";

let data = [];


const web3 = new Web3( new Web3.providers.HttpProvider("https://ropsten.infura.io/<INFURA-TOKEN>") );


let saveData = (index) => (contractData) => {
    data[index] = contractData;
    console.log(index + " " + contractData);
}

for(var i = 0; i < 6; i++){
    
    web3.eth.getStorageAt(address, i).then(saveData(i));

}
