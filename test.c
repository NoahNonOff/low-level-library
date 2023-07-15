#include "libasm.h"

# include <errno.h>

int	main(int ac, char **av)
{
	if (ac != 2)
		return (1);
	printf("|%s| -> %d\n", av[1], verif_base(av[1]));
	return (0);
}
