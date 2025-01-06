#include<string.h>
#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include <errno.h>

long unsigned int ft_strlen(char const *str);
char *ft_strcpy(char *dest, char *src);
int ft_strcmp(char *s1, char *s2);
int ft_write(int fd, const void *buf, size_t count);

void main()
{
    char *msg = "qweqwr";
    char *msgs = 0;
    char *msgss = "";
    char *ptr = malloc(sizeof(char) * strlen(msg));
    char *ptrr = malloc(sizeof(char) * strlen(msg));
    
    //printf("%ld\n", ft_strlen(msg));
    //printf("%ld\n", ft_strlen(msgs));
    //printf("%ld\n", ft_strlen(msgss));

    //printf("%ld\n", strlen(msg));
    //printf("%ld\n", strlen(msgs));
    //printf("%ld\n", strlen(msgss));

    //ptrr = strcpy(ptr, msg);
    //printf("%p\n%p\n", ptr, ptrr);
    //printf("%s\n%s\n", ptr, ptrr);

    //ptrr = ft_strcpy(ptr, msg);
    //printf("%p\n%p\n", ptr, ptrr);
    //printf("%s\n%s\n", ptr, ptrr);

    //printf("%d\n", strcmp(msg, msg));
    //printf("%d\n", strcmp(msgs, msg));
    //printf("%d\n", strcmp(msg, msgs));
    //printf("%d\n", strcmp(msg, msgss));

    //printf("%d\n", ft_strcmp(msg, msg));
    //printf("%d\n", ft_strcmp(msgs, msg));
    //printf("%d\n", ft_strcmp(msg, msgs));
    //printf("%d\n", ft_strcmp(msg, msgss));

    //write(-123123, msg, strlen(msg));
    //printf("%d", errno);
    write(1, "\n", 1);
    
    ft_write(-123123, msg, strlen(msg));
    printf("%d", errno);
    ft_write(1, "\n", strlen("\n"));
}