set_calculator
==============

A compiler project to create a set calculator developed with flex and bison and is prepared for code generating by LLVM.

The input should be like this: (#commment)

{'d', 'f'} + {'d'}    #union

{'a', 'b'} - {'b'}    #difference

{'g', 'e'} * {'g'}    #intersection

and the expected out put should be:

{'d', 'f'}

{'a'}

{'g'}

Please make sure your computer has flex and bison installation to run this project.

Current Version Notation
========================

1. The calc++ example in bison officially provided package is too complex to understand, so I directly modify a simple sample on the internet. 

2. Please directly use "make" command to compile automatically. If there is an error occurs at the step of "flex", you could try "flex calc.l" instead of "flex -o calc.lex.c calc.l". (This is the problem of the version of bison)

3. After compilation, the output file is "a.out". The usage is "./a.out < input" which "input" is the input file in the compression.

4. I was trying hard to do the project, but I've faced a big problem when running the program. The program can scan the input expression till it looks to a operation (+, -, *). I have no idea why the program is always said that "syntax error". In my opinion, it is correct about my grammar to parse the input expression like "{'a', 'b'} + {'d'}" ..., and so on.
