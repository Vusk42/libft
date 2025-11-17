/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   btree_free.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marudlof <marudlof@42angouleme.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/31 17:32:17 by marudlof          #+#    #+#             */
/*   Updated: 2025/11/17 13:53:45 by marudlof         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "../../includes/ft/data/tree.h"

void	btree_free(t_btree *root, void (*del)(void *))
{
	if (!root)
		return ;
	else
	{
		btree_free(root->left, del);
		btree_free(root->right, del);
		if (&(root->content) != NULL)
			(del)(root->content);
		free(root);
	}
}
