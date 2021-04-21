# Godot Blockchain

The idea here is to gain some understanding of how blockchain technology works by building relevant nodes in Godot Engine and coding functionality in GDScript. Then simulate transactions.

## Godot coin

This will represent the tokens that get accumulated into stakes that are held.

![Godot Coin](/assets/godot-coin.png)

The [Godotcoin](https://godotcoin.com) website is now live.

## What is a blockchain?

A blockchain is a growing list of records, called blocks, that are linked using cryptographic hashes. Each block contains a hash of the previous block, a timestamp, and transaction data (generally represented as a Merkle tree). By design, a blockchain is resistant to modification of its data. This is because once recorded, the data in any given block cannot be altered retroactively without alteration of all subsequent blocks.

## Representation of a block

We will use a Proof of Stake (PoS) protocol so as not to waste lots of energy as in a PoW (Proof of Work) system.

* Previous block's hash
* Timestamp - when the block was created
* Transaction data (Merkle tree) - Area of confusion for me!
* Validator address - the validator that was responsible for creating the block

## The network

* Blockchain
* Validators - these are servers around the Internet

## Validators

* Stake - number of tokens (coins) held
* Address - such as the IP address of the server

Maybe these will somehow handle transactions and when there are enough records, want to create a new block containing the tokens/coins. This is the area that I don't understand yet.

## ToDos

* Add test suite
* Figure out how to implement transactions - I don't understand this topic yet
* Understand the role of a Wallet in this system
* Create a UI and graphical representation of nodes
* Be able to run scenarios to simulate activities
