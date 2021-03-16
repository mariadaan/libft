#include "libft.h"

char	**free2d_array(char **array, unsigned int index)
{
	while (index > 0)
	{
		free(array[index - 1]);
		index--;
	}
	free(array);
	return (NULL);
}