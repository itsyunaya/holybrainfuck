/* Small util "header" */

extern "c" I64 write(I64 fd, U8 *buf, I64 count);
extern "c" I64 getchar();

/* It cannot be assumed that these are defined in HolyC so
   we define them with a guard, just to be safe. */
#ifndef NULL
#define NULL 0
#endif

#ifndef EXIT_SUCCESS
#define EXIT_SUCCESS 0
#endif

#ifndef EXIT_FAILURE
#define EXIT_FAILURE 1
#endif

/* By default, HolyC cannot print to stderr, so we import
   the function from libc and have this function as a wrapper
   around it. */
U0 ErrPrint(U8 *msg)
{
	I64 len = StrLen(msg);
	write(2, msg, len);
}