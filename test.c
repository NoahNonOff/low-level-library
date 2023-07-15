#include "libasm.h"

# include <errno.h>

int	main(int ac, char **av)
{
	if (ac != 3)
		return (1);
	printf("%c |%s| -> %d\n", av[1][0], av[2], in_base(av[1][0], av[2]));
	return (0);
}
