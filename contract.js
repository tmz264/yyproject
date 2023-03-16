// Set contract address
const contractAddress = "0xf96ba0e0D0590813a6d90e4E9618824f4ffE0f9a"
// まだ修正してない
 const ContractAbi = [
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_contents",
				"type": "string"
			}
		],
		"name": "createTODO",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_id",
				"type": "uint256"
			}
		],
		"name": "deleteTODO",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getTODO",
		"outputs": [
			{
				"internalType": "uint256[]",
				"name": "",
				"type": "uint256[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "todoToOwner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "todos",
		"outputs": [
			{
				"internalType": "string",
				"name": "contents",
				"type": "string"
			},
			{
				"internalType": "bool",
				"name": "is_opened",
				"type": "bool"
			},
			{
				"internalType": "bool",
				"name": "is_deleted",
				"type": "bool"
			},
			{
				"internalType": "uint256",
				"name": "good",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_id",
				"type": "uint256"
			},
			{
				"internalType": "bool",
				"name": "_is_opened",
				"type": "bool"
			}
		],
		"name": "updateTODO",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]
