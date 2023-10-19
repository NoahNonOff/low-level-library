// test.c
//
// Author: Noah Beaufils
// Date: Oct-17-2023

#include "ll_lib.h"

#include <stdio.h>
#include <errno.h>

int	main(int ac, char *av[]) {

	printf("%d\nEPERM = %d\n", ll_div(8, 0), EPERM);
	if (errno == EPERM)
		perror("8/0");
	return 0;
}