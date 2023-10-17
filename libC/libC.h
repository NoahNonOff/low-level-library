// libC.h
//
// Author: Noah Beaufils
// Date Oct-17-2023

#ifndef _LIBC_H_
# define _LIBC_H_

# include <sys/types.h>

/* ========== protos ========== */

size_t	ft_strlen(const char *);
int		ft_strcmp(const char *, const char *);
char	*ft_strcpy(char *, const char *);
char	*ft_strdup(const char *);
ssize_t	ft_read(int, void *, size_t);
ssize_t	ft_write(int, const void *, size_t);
int		ft_atoi_base(char *, char *);

#endif
