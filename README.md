# low-level-library
**ll_lib** is a fast library using the power of assembler to work directly with registers. To do it, I use netwise assembler (nasm), see the [documentation](https://www.nasm.us/)<br>
The library provides a bunch of function about linked-list, math or classical C functions
### Dependencies:
None...

### usage
After compiling the library, you have to link it with one of your project (1). **WARNING:** Remember to include the library in one of your file (2)
```shell
gcc $(FLAGS) libasm.a $(OBJECT_FILE) -o exec_name
```
```C
#include "ll_lib.h"
```

### Links
Here are the links I use to learn assembly and so build this library
* [understand the concept of register](https://tirkarp.medium.com/understanding-x86-assembly-5d7d637efb5)
* [understand the FLAGS register](https://fr.wikipedia.org/wiki/RFLAGS)
* [List of Jump conditions](https://www.gladir.com/LEXIQUE/ASM/jumpif.htm)
<br>
Date: Oct 2023
