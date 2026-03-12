#include "./stdio.hh"

U8 Main(I32 argc, U8 **argv)
{
if (argv[1] == NULL) {
    ErrPrint("Error: Please specify a file to interpret.\n");
    return EXIT_FAILURE;
}

U8 *file = FileRead(argv[1]);
I64 len = StrLen(file);
U64 *tape = MAlloc(8 * 30000);
MemSet(tape, 0, 8 * 30000);
U64 *ptr = &tape[0];

I64 c;
for (c = 0; c < len; c++) {
    switch (file[c]) {
	/* Trying to index out of bounds of the 30k entry array will result in 
	   undefined behaviour, according to the spec. This principle is adopted
	   here too, but may be changed at a later point. */
    case '>': ptr++; break;
    case '<': ptr--; break;
    case '+': (*ptr)++; break;
    case '-': (*ptr)--; break;
	/* Spec compliance: if the char to print is 
	   larger than 255, only print the first byte. */
    case '.': "%c", (*ptr & 0xFF); break;
	/* Spec compliance: only get one byte of input. */
    case ',': *ptr = getchar() & 0xFF; break;
    case '[':
        if (!*ptr) {
        I64 depth = 1;
        while (depth) {
            c++;
            if (file[c] == '[') depth++;
            if (file[c] == ']') depth--;
        }
    }
    break;
    case ']':
        if (*ptr) {
          	I64 depth = 1;
          	while (depth) {
            	c--;
            	if (file[c] == ']') depth++;
            	if (file[c] == '[') depth--;
          	}
        }
        break;
      default: break;
    }
  }

/* The spec doesn't say anything about having to newline terminate 
   the output in the interpreter itself so we leave it out for now. */
//printf("\n");
Free(tape);
Free(file);
return EXIT_SUCCESS;
}