/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_freeptr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marudlof <marudlof@42angouleme.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/20 12:56:32 by marudlof          #+#    #+#             */
/*   Updated: 2025/10/20 23:07:15 by marudlof         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft/memory.h"
#include <stdlib.h>

void	ft_freeptr(void **nptr)
{
	while (*nptr++)
		free (*nptr);
	free (nptr);
}
