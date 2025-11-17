/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_dbadd_front.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marudlof <marudlof@42angouleme.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/30 19:19:04 by marudlof          #+#    #+#             */
/*   Updated: 2025/10/30 19:39:26 by marudlof         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft/data/dblist.h"

void	ft_dbadd_front(t_stack **stack, t_stack *newl)
{
	if (!stack || !newl)
		return ;
	newl->next = *stack;
	(*stack)->prev = newl;
	*stack = newl;
}
