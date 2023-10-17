// test.c
//
// Author: Noah Beaufils
// Date: Oct-17-2023

#include "libC/libC.h"
#include "math/math.h"
#include "linked_list/linked_list.h"

#include <stdio.h>

int	main(int ac, char *av[]) {

	int a = 45;
	int b = -27;

	printf("%d\n", ll_abs(a));
	printf("%d\n", ll_abs(b));
	return 0;
}