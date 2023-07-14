// libasm.h
//
// Author: Noah Beaufils
// Date Jul-14-2023

#ifndef _LIBASM_H_
# define _LIBASM_H_

# include <string.h>
# include <stdio.h>
# include <inttypes.h>
# include <stdlib.h>
// open / read / write / close
# include <unistd.h>
# include <sys/stat.h>
# include <fcntl.h>

size_t	ft_strlen(const char *);
int 	ft_strcmp(const char *, const char *);
char	*ft_strcpy(char *, const char *);
char	*ft_strdup(const char *);
ssize_t	ft_read(int, void *, size_t);
ssize_t ft_write(int, const void *, size_t);

#endif
