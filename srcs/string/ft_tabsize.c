/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_tabsize.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marudlof <marudlof@42angouleme.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/19 18:16:35 by marudlof          #+#    #+#             */
/*   Updated: 2025/10/20 02:45:12 by marudlof         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft/string.h"

size_t	ft_tabsize(void **tab)
{
	size_t	size;

	if (!tab || !(*tab))
		return (0);
	size = 0;
	while (tab[size])
		size++;
	return (size);
}
