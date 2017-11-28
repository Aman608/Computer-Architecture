

Memory Specifications
Cache Size 1KB
Cache Line Size 16B
Associativity 4
Write Policy: Write Buffer
Replacement policy: LRU Counter
Cache Type: Way Halting


#Offset bits = 4
#Index bits = 4
#Tag bits = 24 (4 halt tag, 20 main tag)

Total cache size = Data array Size +  Main Tag array size + Halt tag array size + Valid array size + Write Buffer Size

= 1KB + (20x4x16)/8 bytes + (4x4x16)/8 bytes + (1x4x16)/8 bytes + [(16x4)bytes + (28x4)/8 bytes + (1x4)/8bytes]
= 1024B + 160B + 32B + 8B + 78.5
= 1302.5 Bytes

#Using the TestBench in Cache.v File.
#total misses: 6
#total hits: 13 (assuming every miss is followed by hit.)


Names of Members, contribution and contribution percentage:

