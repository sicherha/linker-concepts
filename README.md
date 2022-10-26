This is a toy repository for the purpose of exploring the fundamental concepts
behind linking an ELF program on Linux:

* symbols,
* sections,
* relocations,
* GOT,
* PLT.

# How to ...
## Build the program
```
make
```
## Retrieve a file's symbol table
```
nm <file>
```
## Retrieve the sections in a file
```
readelf -S <file>
```
## Disassemble machine code
```
objdump -d <file>
```
## Get the relocation table
```
readelf -r <file>
```
