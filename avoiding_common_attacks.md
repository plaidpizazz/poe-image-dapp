# Avoiding Common Attacks

I created the following analysis for how I avoid common attacks based on the [Contract Safety Checklist](https://www.kingoftheether.com/contract-safety-checklist.html)
In the following, I explain how I mitigate each vulnerability.

### Logic Bugs

Without a proper security audit, I cannot guarantee that the contract is logic bug free, but it
is secure enough (in my eyes) for demonstration purposes. I followed solidity coding standards
and the Checks-Effects-Interactions patterns. I tried to keep the methods as simple and short as
possible to avoid overly complex functionality.

### Failed Sends

I did not use `send` in my contract, so not applicable.

### Recursive Calls

Not applicable since my contract does not call any other contract.

### Integer Arithmetic Overflow

I don't use arithmetic in the contract, but check that the index input is never smaller than 0 or
larger than the length of the registry array.

### Poison Data

I could have added a check for user input data for length, i.e., (cannot be of length 0 of larger than 64 bytes) but did not due to time constraints on connecting smart contract to UI.

### Exposed Functions

I made sure that all functions are properly exposed by giving every function either an `external` or `internal` modifier. Also, the external functions are written first in the contract, before the internal functions. This should make it easier to distinguish which functions are externally accessible and which are not.

### Exposed Secrets

All input information is hashed, therefore if the user decides on storing secret information in the contract at least it will be hashed. This does not make the data completely meaningless since an attacker could still take the data hash from the contract and reverse engineer the original data by brute-force. However, ultimately it is up to the user which data she wants to store on the blockchain.

### Denial of Service / Dust Spam

This vulnerability was mitigated by limiting the length of the input data and avoiding looping
behaviour in state-changing functions.

### Miner Vulnerabilities

The contract saves a hash including a timestamp of registration, but does not use the value for any internal functions. If ownership was questioned, the timestamp can be used in a audit to determine who registered an image.

### Malicious Creator

I did not use any `selfdestruct` functions or give the creator the ability to change image ownership.

### Off-chain Safety

No off-chain vulnerabilities were purposefully mitigated for this project, but this would be a focus area for production development. I would take appropriate actions like
using HTTPS and following OWASP guidelines.

### Cross-chain Replay Attacks

The contract was only deployed to localhost testnet or (Ethereum Foundation Rinkby testnet); therefore, it is not available from the Ethereum Classic network. The contract is not payable anywhere, so no Ethereum Classic funds can get lost even if on purpose.

### Tx.Origin Problem

Not applicable since `TX.Origin` is not used at all.

### Solidity Function Signatures and Fallback Data Collisions

Not applicable since no fallback function is used.

### Incorrect use of Cryptography

Not applicable since no cryptography is used except for the `SHA-256` function, which is built-in.

### Gas Limits

No loops are used in any state-changing function. State-changing functions are held simple and deterministic. Also, no external function calls another external function, therefore the gas limit does not grow unpredictably.

### Stack Depth Exhaustion

No loops are used in any external function and also no `send`s are used anywhere.
