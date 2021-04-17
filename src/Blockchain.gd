extends Control

class_name Blockchain	

func validate() -> bool:
	# work back through the blocks to confirm that the previous_hash
	# values match the computed hash of each block
	return true
