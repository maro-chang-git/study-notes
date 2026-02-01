# Topics - Problem lists
- [ ] x

Reference:
https://leetcode.com/discuss/post/4837287/nvidia-oa-questions-by-anonymous_user-7s7n/
### Math
- [ ] Calculate ***multiplication*** of both numbers without the multiple operator
- [ ] [[Calculate x to the power y ]]  #easy 
- [ ] Calculate the square root of a number
- [ ] [[Fibonacci series ]]  
- [ ] Add string - Big numbers      #easy
- [ ] Rectangle Area                       #medium

### Arrays / Lists
- [ ] List enumeration problem
- [ ] Calculate ***median and average*** of an array
- [ ] 2 sum                               #easy #hashmap
- [ ] 3 sum                               #medium  #sort + #2pointers
- [ ] Maximum Subarray         #easy #DP, #slidingWindow if fixed array, #sort + #slidingWindow
- [ ] Knapsack -> Find maximum value, <= max weight #DP, #greedy
- [ ] Given an array of numbers, in which all numbers except one occur twice (e. g. 1 2 3 2 3), ***find the unique number***. 
	- #easy #XOR to remove number, the remain num is the unique number. 
	- #easy #hashmap to count, if count == 1 then unique
- [ ] Given an array of elements whose range are 0 - N. 1 element is missing, no duplicate. ***Find the missing element***.
	- #easy #math
	  `total_sum = n*(n+2) //2`
	  `actual_sum = sum(nums)`
	  `return total_sum - actual_sum`
- [ ] Same as before, but ***Find 2 elements are missing***.
- [ ] Search in Rotated Sorted Array    #medium 
      #modified_binary_search : 2 pointers left-right to find the middle, but actual left-right is diff because the boundary values. 
- [ ] ***Remove duplicate elements*** in an array #easy
      #set to keep the unique values
      #hashmap to keep track of the key
- [ ] Trapping rain water          #hard
      #2pointers left-right pair, find the max
      #stack
      #DP

### 2D arrays / Matrix 
- [ ] Rotate a matrix
      Rotate 90 degree
      Clockwise / Anti-clockwise

### Hashmap
- [ ] Design Hashmap                 #easy
- [ ] Climbing Stairs
### Sorting
- [ ] Merge Sort
- [ ] Merge k Sorted list              #hard
- [ ] Implement sort in O(N)
- [ ] Median of Two sorted Array
- [ ] Sort an array of 0s and 1s
- [ ] Sort an array with only 0, 1, 2 and do it while accessing every element only once and without counting the number of each one.
- [ ] Count the 1s in an integer ?

### String manipulations
- [ ] ***Reverse*** a string         #easy
- [ ] Longest ***Palindromic*** Substring
- [ ] Check if two strings are ***anagrams***
- [ ] Convert aaabbbcccc -> 4a3b4c
- [ ] Divide the string into words based on a delimiter
- [ ] Given a file of whitespace-separated strings, output their number of occurrences and optionally sort the strings by the number of occurrences

### Linked list
- [ ] Reverse a linked list 
- [ ] Delete node. Given a pointer to a node in the linked list, delete the node. No root node is necessary
- [ ] Find middle of the doubly linked list and delete it.

### Heap, stack, queue
- [ ] Implement a min-heap from scratch with insert and extractMin operations.
- [ ] What is the difference between stack and heap?
- [ ] Priority queue

### Tree
- [ ] Tree traverse problem
- [ ] Validate binary search tree
- [ ] Describe what happens when a segfault occurs Binary tree length?

### Graph
- [ ] Tree traverse problem

### Bit manipulation
- [ ] Given a and b numbers each one is 2bits, return 1 if a > b
- [ ] Implement a system that calculates the sum of '1' bits coming from an 7 bits input.

### LRU Cache - Least Recently Used Cache
- [ ] x

### DP
- [ ] x