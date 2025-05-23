/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_substr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: engiacom <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/07 14:52:31 by engiacom          #+#    #+#             */
/*   Updated: 2024/11/07 18:41:12 by engiacom         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_substr(char const *s, unsigned int start, size_t len)
{
	char	*res;
	size_t	i;

	i = 0;
	if (!s)
		return (NULL);
	if (start >= ft_strlen(s))
	{
		return (res = ft_calloc(1 * sizeof(char), 1));
	}
	if (ft_strlen(s) > start + len)
		res = malloc((len + 1) * sizeof(char));
	else
		res = malloc(((ft_strlen(s) - start) * (sizeof(char))) + 1);
	if (res == NULL)
		return (NULL);
	while (s[start + i] && i < len)
	{
		res[i] = s[start + i];
		i++;
	}
	res[i] = 0;
	return (res);
}
