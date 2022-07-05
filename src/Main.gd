extends Control

var network: Network

func _ready():
	network = Network.new()
	network.blockchain = Blockchain.new()
	network.blockchain.name = "Blockchain"
	network.add_child(network.blockchain)
	network.name = "Network"
	add_child(network)
	
	# Create validator nodes
	var v1 = Validator.new()
	v1.address = "v1"
	v1.stake = 1
	network.validators.append(v1)
	
	var v2 = Validator.new()
	v2.address = "v2"
	v2.stake = 2
	network.validators.append(v2)
	
	var v3 = Validator.new()
	v3.address = "v3"
	v3.stake = 5
	network.validators.append(v3)
	
	# Add Genesis block 
	network.blockchain.add_block()
	
	# Mint new block based on choosing a lucky validator
	network.blockchain.add_block(network.pick_validator())
