/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marudlof <marudlof@42angouleme.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/19 13:45:37 by marudlof          #+#    #+#             */
/*   Updated: 2026/11/04 16:46:25 by marudlof         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdarg.h>
# include <string.h>

int	ft_printf(const char *format, ...)	__attribute__ ((format (printf, 1, 2)));
int	ft_dprintf(int fd, const char *format, ...) __attribute__ ((format (printf, 2, 3)));

#endif
