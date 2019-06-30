
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
   2.1. We'll build our dictionary up to a max size and dump to disk
   2.2. It adds a linear element but not too terrible
 3. List of files with same hash might exceed memory
   3.1.
 4. List of hashes with collisions may exceed memory
