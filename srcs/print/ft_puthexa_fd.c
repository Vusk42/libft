/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_puthexa_fd.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marudlof <marudlof@42angouleme.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/19 12:34:01 by marudlof          #+#    #+#             */
/*   Updated: 2025/10/20 23:11:26 by marudlof         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft/print.h"

int	ft_puthexa_fd(long long int n, char format, int fd)
{
	size_t	nbr_len;

	nbr_len = 0;
	if (format == 'p')
		nbr_len += write(fd, "0x", 2);
	if (format == 'X')
		nbr_len += ft_putnbr_base_fd(n, "0123456789ABCDEF", fd);
	if (format == 'x' || format == 'p')
		nbr_len += ft_putnbr_base_fd(n, "0123456789abcdef", fd);
	return (nbr_len);
}
