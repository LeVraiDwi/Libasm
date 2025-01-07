#ifndef LIBASM_H
# define LIBASM_H

# include <stddef.h>

long    unsigned int ft_strlen(char const *str);
char    *ft_strcpy(char *dest, char *src);
int     ft_strcmp(char *s1, char *s2);
int     ft_write(int fd, const void *buf, size_t count);
char    *ft_strdup(char *s);
size_t  ft_read(int fd, void *buf, size_t count);

#endif