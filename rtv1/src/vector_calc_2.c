/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   vector_calc_2.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hbock <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/11/17 12:21:50 by hbock             #+#    #+#             */
/*   Updated: 2016/11/17 12:21:55 by hbock            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/rtv1.h"

t_vec		rot_xyz(t_vec v, double x, double y, double z)
{
	v = rot_x(x, v);
	v = rot_y(y, v);
	v = rot_z(z, v);
	return (v);
}
