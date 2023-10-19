// ll_lib.h
//
// Author: Noah Beaufils
// Date Oct-19-2023

#ifndef _LL_LIB_H_
# define _LL_LIB_H_

# include <sys/types.h>

/* ========== struct ========== */

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}	t_list;

/* ========== protos ========== */

extern int 		ll_list_size( t_list * );
extern void		ll_free_list( t_list * );
extern void		ll_list_push_front( t_list **, void * );
extern t_list	*ll_create_elem( void * );

extern int		ll_add( int, int );
extern int		ll_minus( int, int );
extern int		ll_mult( int, int );
extern int		ll_div( int, int );
extern int		ll_abs( int ); // limits[-2147483647;2147483647]

extern int		ll_strcmp(const char *, const char *);
extern int		ll_atoi_base(char *, char *);
extern char		*ll_strcpy(char *, const char *);
extern char		*ll_strdup(const char *);
extern size_t	ll_strlen(const char *);
extern ssize_t	ll_read(int, void *, size_t);
extern ssize_t	ll_write(int, const void *, size_t);

#endif
