
App phases
============

 1. Hashing
   1.1. Walk FS
   1.2. hash files with sha256 (no known)
   1.3. dump (hash => path) into memory-bound dict
 2. Dupe search
   2.1. Iterate over hash dict
   2.2. print hash matches for hashes we haven't already encountered
   2.3. As we could have matches spread over multiple files, store processed hashes

Assumptions/Considerations
=========================

1. same (hash, length) == same file. Chance of sha256 collision is vanishingly small
2. Dict of hash => path pairs might exceed memory
   - We can build our dictionary up to a max size and dump to disk
   - It adds a linear element but not too terrible
3. List of files with same hash might exceed memory
   - So we want to compare and print incrementally
4. List of hashes with collisions may exceed memory
   - If we generalise our solution to 2, we can re-use for this.
5. We should ignore .hidden, aka dot, files

Considered solutions
=====================

1. In-memory dictionary of hash => [path]

  If we expect an average path length of 64 bytes and use sha-256, each file takes
  approx 100 bytes, let's say 128b (2^7) to allow overheads. 4GB, 2^32, means
  we can hold approx 32 million (2^25) file hashes in memory before we hit that limit.

2. 3-stage process

 1. Print "#{hash}|#{path}" out sequentially
 2. Sort file
 3. Dupes will be

  Step 2 is non-trivial and already exists in multiple implementations. Would be
  unlikely to re-implement myself in production code.

3. Segmented dictionary

   Use similar process to 1, but dump out dictionaries in sequentially named
   files if we exceed our memory budget.

   Getting all values for a given hash is slower, but will scale.
   Need to store processed collisions to ensure we don't reprint.

4. Use built-in SDBM key value store

  To beat 1, it needs to scale beyond a 4GB data set. This seems unlikely but
  can be easily tested using some fake data.

5. Use external, DB. Very simple to implement a process similar to **2.** by
   streaming hashes to a table then adding an index. This would likely get decent
   performance too as it is what RDMBS can do all day.
