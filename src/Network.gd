extends Control

class_name Network

var blockchain: Blockchain
var head_block: Block
var validators: Array

func add_block(block: Block):
	block.timestamp = OS.get_unix_time()
	blockchain.add_child(block)
	head_block = block
