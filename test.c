#include "libasm.h"

void	print_list(t_list **lst);

int	main(int ac, char **av)
{
	int	a = 42;
	int	b = 27;
	int	c = 32;
	int	d = 127;
	t_list	**lst;
	t_list	*ls;

	lst = &ls;
	ls = ft_create_elem((void *)&a);

	ft_list_push_front(&ls, (void *)&b);
	ft_list_push_front(&ls, (void *)&c);
	ft_list_push_front(&ls, (void *)&d);

	printf("list_len (%d):\n", ft_list_size(ls));
	print_list(lst);
	free_list(ls);
	return (0);
}

void	print_list(t_list **lst)
{
	int		i = 0;
	t_list	*act;

	if (!lst)
		return ;
	act = *lst;
	while (act)
	{
		printf("%d) data = %d\n", i++, *(int *)act->data);
		act = act->next;
	}
}
