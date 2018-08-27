# Design Pattern Decisions

---

## System Design Considerations

The main requirement of the smart contract is to check if image was already registered by someone on blockchain and who owns the image. I decided on fulfilling this requirement by creating a relatively simple proof of existence contract that stores the owner of images.

### Auto Depreciation

The contract serves as a storage for registering image and owner, its data rather than its
functionality is most important. The contract cannot be replaced or depreciated
since otherwise the storage would be lost. No Auto Depreciation design pattern implemented.

### Mortal

I do not want to give the image owner the power over the contract and any stored images, so I haven't implemented the `mortal` design pattern. The contract can be
paused if an emergency arises, but no one should be able to fully delete or destruct it.

### Relay

Similar to `Auto Depreciation`, the contract cannot be replaced without loosing its meaningfulness. So the `relay` pattern would not make sense in the given context and was not implemented.

### Data Segregation

This design pattern would work well for this type of project, but would add to much complexity for what I was trying to achieve. So `Data Segregation` was not implemented. However, for a production project, I would implement.

### Ownership

This design pattern was implemented by using the `Ownable` contract of Open Zeppelin. Base contract provides onlyOwner modifier, which prevents function from running if it is called by anyone other than the owner.

### Circuit Breaker

This design pattern was implemented by using the `Killable` contract of Open Zeppelin. Base contract that can be killed by owner. All funds in contract will be sent to the owner.

### Rejector

This pattern was implemented to reject any ether send accidentally or not to the contract.

### Speed Bump

This pattern was not implemented since I did not want to restrict the speed with which the
contract can be used. A user can register as many images as they want as long as they are willing to spend the necessary Ether.

### Restricting Access

I used the `isOwner` modifier to restrict the access and control over a image registration to
the address of its owner. This is meant to prevent anybody but the owner to remove the image
registration or transfer the image ownership to another address.

### General Contract Security

I followed the Checks-Effects-Interactions coding pattern in my code to prevent reentry and other possible attacks.
