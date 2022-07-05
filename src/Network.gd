extends Control

class_name Network

var blockchain: Blockchain
var validators: Array

func pick_validator() -> Validator:
	var total_stakes = 0
	var stakes = []
	var the_chosen_one: Validator
	for v in validators:
		var validator: Validator = v
		total_stakes += validator.stake
		stakes.append(validator.stake)
	var pick = randi() % total_stakes
	for i in stakes.size():
		pick -= stakes[i]
		if pick < 0:
			the_chosen_one = validators[i]
			break
	return the_chosen_one
