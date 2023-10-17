// linked_list.h
//
// Author: Noah Beaufils
// Date Oct-17-2023

#ifndef _LINKED_LIST_H_
# define _LINKED_LIST_H_

/* ========== struct ========== */

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}	t_list;

/* ========== protos ========== */

int 	ft_list_size( t_list * );
void	free_list( t_list * );
void	ft_list_push_front( t_list **, void * );
t_list	*ft_create_elem( void * );

#endif
