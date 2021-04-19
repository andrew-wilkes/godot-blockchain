extends Control

class_name Blockchain	

# work back through the blocks to confirm that the previous_hash
# values match the computed hash of each block
func validate() -> bool:
	var valid = true
	var index = get_child_count() - 1
	var block: Block = get_child(index)
	while index > 0:
		index -= 1
		var next_block: Block = get_child(index)
		valid = block.timestamp > next_block.timestamp and block.previous_hash == get_hash(next_block)
		if not valid:
			index = 0
		block = next_block
	return valid


func get_hash(block: Block):
	return (block.previous_hash + String(block.timestamp) + block.tx_root + String(block.validator.get_instance_id())).sha256_text()


func add_block(validator: Validator = null):
	var block = Block.new()
	block.timestamp = OS.get_unix_time()
	if validator == null:
		validator = Validator.new()
	else:
		block.previous_hash = get_hash(get_children().pop_back())
	block.validator = validator
	add_child(block)
