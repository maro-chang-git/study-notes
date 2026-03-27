It's a Universal Unique ID - 128 bit.
In a form of `8-4-4-4-12`

Example:
`550e8400-e29b-41d4-a716-446655440000`

#### Advantages:
- **Unique ID across system**, highly useful for decentralized systems
- Good for **primary key**. If use regular auto increment ID -> Can guess how many record in DB. 

#### Versions
- Version 1 (Time-Based): Combines a timestamp, a clock sequence, and the MAC address of the generating device. This ensures uniqueness for that host at that point in time.

- Version 2 (DCE Security): Similar to Version 1 but includes additional information for security purposes. It is not widely used.

- Version 3 (Name-Based, MD5): Uses MD5 hashing of a namespace identifier and a name to generate the UUID. This ensures that the same namespace and name will always produce the same UUID.

- Version 4 (Random): Generates UUIDs using random or pseudo-random numbers. This version is commonly used due to its simplicity and the negligible probability of collisions.

- Version 5 (Name-Based, SHA-1): Similar to Version 3 but uses the SHA-1 hashing algorithm, providing a stronger hash.

- Version 6 (Timestamp and Random): Designed for high-load databases and distributed systems, combining a timestamp with random bits.

- Version 8 (Custom): Allows vendors to define their own UUID structure while adhering to certain constraints.
