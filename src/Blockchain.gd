extends Control

class_name Blockchain	

# work back through the blocks to confirm that the previous_hash
# values match the computed hash of each block
func validate() -> bool:
	var valid = true
	var index = get_child_count() - 1
	var block: Block = get_child(index)
	var crypto = Crypto.new()
	while index > 0:
		index -= 1
		var next_block: Block = get_child(index)
		valid = block.timestamp > next_block.timestamp and \
		 crypto.constant_time_compare(block.previous_hash.to_ascii() == get_hash(next_block).to_ascii())
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
		# We are creating the first (Genesis) block
		block.validator = Validator.new()
		add_child(block)
	else:
		block.previous_hash = get_hash(get_children().pop_back())
		block.validator = validator
		# Check for tampering with the network
		if validate(): # TODO: and validate_block()
			add_child(block)
		else:
			penalize_validator(validator)


func penalize_validator(validator: Validator):
	validator.stake -= 10
	if validator.stake < 0:
		validator.stake = 0
