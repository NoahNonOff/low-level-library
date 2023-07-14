#include "libasm.h"

int	main(void)
{
	char	*str;

	str = ft_strdup("welcome to earth");
	printf("str -> |%s|\n", str);
	free(str);
	return (0);
}
