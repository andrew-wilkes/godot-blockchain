# Godot Blockchain

The idea here is to gain some understanding of how blockchain technology works by building relevant nodes in Godot Engine and coding functionality in GDScript. Then simulate transactions.

## What is a blockchain?

A blockchain is a growing list of records, called blocks, that are linked using cryptographic hashes. Each block contains a hash of the previous block, a timestamp, and transaction data (generally represented as a Merkle tree). By design, a blockchain is resistant to modification of its data. This is because once recorded, the data in any given block cannot be altered retroactively without alteration of all subsequent blocks.

## Representation of a block

We will use a Proof of Stake (PoS) protocol so as not to waste lots of energy as in a PoW (Proof of Work) system.

* Previous hash
* Timestamp
* Transaction root
* Validator address

## The network

* Blockchain
* Headblock
* Validators

## Node

May act as a Validator.

* Stake - number of tokens held.
* Address
