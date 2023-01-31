/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putunbr_base.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mrudloff <mrudloff@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/31 10:17:22 by mrudloff          #+#    #+#             */
/*   Updated: 2023/01/31 10:17:29 by mrudloff         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libft.h>

int	ft_putunbr_base(unsigned long long int n, const char *base)
{
	unsigned long long int	base_len;
	int						nbr_len;

	nbr_len = 0;
	base_len = ft_strlen(base);
	if (n >= base_len)
	{
		ft_putunbr_base(n / base_len, base);
		ft_putunbr_base(n % base_len, base);
	}
	else
		write(1, &base[n], 1);
	nbr_len += ft_unbrlen_base(n, base_len);
	return (nbr_len);
}
