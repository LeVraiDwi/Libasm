#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "libasm.h"


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

    int fd = open("/home/tcosse/sgoinfre/Libasm/text.text", O_CREAT + O_RDWR);

    int nb = write(fd, msg, strlen(msg) + 4);
    printf("%d\n", nb);
    write(1, "\n", 1);
    
    nb = ft_write(fd, msg, strlen(msg) + 4);
    printf("%d\n", nb);
    ft_write(1, "\n", strlen("\n"));

    close(fd);

    fd = open("/home/tcosse/sgoinfre/Libasm/", O_CREAT + O_RDWR);

    // nb = write(fd, msg, strlen(msg) + 4);
    // printf("%s\n", strerror(errno));
    // printf("%d\n", nb);
    // write(1, "\n", 1);
    
    // nb = ft_write(fd, msg, strlen(msg) + 4);
    // printf("%s\n", strerror(errno));
    // printf("%d\n", nb);
    // ft_write(1, "\n", strlen("\n"));

    close(fd);

    //char *newMsg = strdup(msg);
    //printf("%s\n", newMsg);
    //free(newMsg);
    //
    //newMsg = ft_strdup(msg);
    //printf("%s\n", newMsg);
    //free(newMsg);

    //newMsg = ft_strdup("");
    //printf("%s\n", newMsg);
    //free(newMsg);

    //newMsg = strdup("");
    //printf("%s\n", newMsg);
    //free(newMsg);

    char *newMsg = ft_strdup(msg);
    int i = 0;
    printf("%s\n", newMsg);
    free(newMsg);

    fd = open("./exemple_asm/operation.s", O_APPEND + O_RDWR);
    newMsg = malloc(sizeof(char) * 40);
    newMsg[0] = 0;
    nb = ft_read(fd, newMsg, 40);
    printf("%s\n", newMsg);
    printf("%d\n", nb);
    free(newMsg);

    fd = open("./exemple_asm", O_APPEND + O_RDWR);
    newMsg = malloc(sizeof(char) * 40);
    newMsg[0] = 0;
    nb = ft_read(fd, newMsg, 40);
    free(newMsg);

    close(fd);
    printf("%s\n", newMsg);
    printf("%s\n", strerror(errno));
    printf("%d\n", nb);
    return;
}