## Basic EOA Batch Executor (BEBE)

A basic stateless [ERC-7821](https://eips.ethereum.org/EIPS/eip-7821) style batch executor contract for EOAs to delegate to for [EIP-7702](https://eips.ethereum.org/EIPS/eip-7702).

This is essentially [ERC-7821](https://eips.ethereum.org/EIPS/eip-7821) with the addition of a [ERC-1271](https://eips.ethereum.org/EIPS/eip-1271) `isValidSignature` that performs a `ecrecover` and checks against the EOA address.

## Deployments

TBD
