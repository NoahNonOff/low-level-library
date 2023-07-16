// libasm.h
//
// Author: Noah Beaufils
// Date Jul-14-2023

#ifndef _LIBASM_H_
# define _LIBASM_H_

/* ========= includes ========= */

# include <string.h>
# include <stdio.h>
# include <inttypes.h>
# include <stdlib.h>
# include <unistd.h>
# include <sys/stat.h>
# include <fcntl.h>
# include <errno.h>

/* ========== struct ========== */

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}	t_list;


/* ========== protos ========== */

size_t	ft_strlen(const char *);
int 	ft_strcmp(const char *, const char *);
char	*ft_strcpy(char *, const char *);
char	*ft_strdup(const char *);
ssize_t	ft_read(int, void *, size_t);
ssize_t ft_write(int, const void *, size_t);

int		ft_atoi_base(char *, char *);
int 	ft_list_size(t_list *);
void    free_list(t_list *);
void 	ft_list_push_front(t_list **, void *);
t_list	*ft_create_elem(void *data);

#endif
