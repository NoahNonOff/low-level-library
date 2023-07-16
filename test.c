#include "libasm.h"

int	main(int ac, char **av)
{
	if (ac != 3)
		return (1);
	printf("|%s| |%s| -> %d\n", av[1], av[2], ft_atoi_base(av[1], av[2]));
	printf("|NULL| |%s| -> %d\n", av[2], ft_atoi_base(NULL, av[2]));
	printf("|%s| |NULL| -> %d\n", av[1], ft_atoi_base(av[1], NULL));
	return (0);
}
