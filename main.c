/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nbeaufil <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/31 16:29:25 by nbeaufil          #+#    #+#             */
/*   Updated: 2023/06/04 03:41:56 by nbeaufil         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>

/* ========= proto ========== */
size_t	ft_strlen(const char *);
int 	ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(char *dest, const char *src);
char	*ft_strdup(const char *s);

int		test_strcmp(void);
int		test_strcpy(void);
int		test_strlen(void);
int		test_strdup(void);

/* ========== main ========== */
int	main(void)
{
	printf("\n\x1B[1m--> test for strcmp:\x1B[0m\n\n");
	test_strcmp();
	printf("\n\x1B[1m--> test for strlen:\x1B[0m\n\n");
	test_strlen();
	printf("\n\x1B[1m--> test for strcpy:\x1B[0m\n\n");
	test_strcpy();
	printf("\n");
	return (0);
}

/* ========== test ========== */

int	test_strcmp(void)
{
	char	*test1 = "hi america !!";
	char	*test2 = "welcome to south korea...";
	char	*test3 = "";
	char	*test4 = "              ";
	char	*test5 = NULL;
	int		res1 = strcmp(test1, test1);
	int		res2 = strcmp(test1, test2);
	int		res3 = strcmp(test2, test4);
	int		res4 = strcmp(test1, "test");

	printf("\t\'%s\' and \'%s\': ft: %d tr: %d\n", test1, test1, ft_strcmp(test1, test1), res1);
	printf("\t\'%s\' and \'%s\': ft: %d tr: %d\n", test1, test2, ft_strcmp(test1, test2), res2);
	printf("\t\'%s\' and \'%s\': ft: %d tr: %d\n", test2, test4, ft_strcmp(test2, test4), res3);
	printf("\t\'%s\' and \'test\': ft: %d tr: %d\n", test1, ft_strcmp(test1, "test"), res4);
	printf("\ttest for NULL: ft: %d\n", ft_strcmp(test5, "test"));
	return (0);
}

int	test_strlen(void)
{
	char	*test1 = "hi america !!";
	char	*test2 = "welcome to south korea...";
	char	*test3 = "";
	char	*test4 = "              ";
	char	*test5 = NULL;

	printf("\t\'%s\': %ld must be equal to %ld\n", test1, ft_strlen(test1), strlen(test1));
	printf("\t\'%s\': %ld must be equal to %ld\n", test2, ft_strlen(test2), strlen(test2));
	printf("\t\'%s\': %ld must be equal to %ld\n", test3, ft_strlen(test3), strlen(test3));
	printf("\t\'%s\': %ld must be equal to %ld\n", test4, ft_strlen(test4), strlen(test4));
	printf("\t\'%s\': test for NULL: %ld\n", test5, ft_strlen(test5));
	return (0);
}

int	test_strcpy(void)
{
	char	*test1 = "hi america !!";
	char	*test2 = "welcome to south korea...";
	char	*test3 = "";
	char	*test4 = "              ";
	char	*test5 = NULL;
	char	dest1[50];
	char	dest2[50];
	char	dest3[50];
	char	*test;

	ft_strcpy(dest1, test1);
	printf("\tsrc = $%s$ dest = $%s$\n", test1, dest1);
	ft_strcpy(dest2, test2);
	printf("\tsrc = $%s$ dest = $%s$\n", test2, dest2);
	ft_strcpy(dest2, test4);
	printf("\tsrc = $%s$ dest = $%s$\n", test4, dest2);
	ft_strcpy(dest3, test5);
	printf("\tsrc = $%s$ dest = $%s$\n", test5, dest3);
	test = ft_strcpy(dest2, test2);
	printf("\tsrc = $%s$ dest = $%s$\n", test2, test);
	return (0);
}

int	test_strdup(void)
{
	char	*test1 = "hi america !!";
	char	*test2 = "welcome to south korea...";
	char	*test3 = "";
	char	*test4 = "              ";
	char	*test5 = NULL;
	char	*dest1;
	char	*dest2;
	char	*dest3;

	dest1 = ft_strdup(test1);
	printf("\tsrc = $%s$ dest = $%s$\n", test1, dest1);
	free(dest1);
	dest2 = ft_strdup(test2);
	printf("\tsrc = $%s$ dest = $%s$\n", test2, dest2);
	free(dest2);
	dest2 = ft_strdup(test4);
	printf("\tsrc = $%s$ dest = $%s$\n", test4, dest2);
	free(dest2);
	dest3 = ft_strdup(test5);
	printf("\tsrc = $%s$ dest = $%s$\n", test5, dest3);
	free(dest3);
	dest2 = ft_strdup(NULL);
	printf("\tsrc = (null) dest = $%s$\n", dest2);
	return (0);
}
