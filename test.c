#include "libasm.h"

# include <errno.h>

int	main(void)
{
	int	fd;
	int	ret;
	char	buff[1000] = {0};

	fd = open("test.c", O_RDONLY);
	ret = ft_read(fd, buff, 1000);
	printf("errno = %d %s\n", errno, strerror(errno));
	printf("ret1 -> %d\n", ret);
	ret = ft_write(1, buff, ret);
	printf("ret2 -> %d\n", ret);
	printf("errno = %d %s\n", errno, strerror(errno));
	close(fd);
	return (0);
}
