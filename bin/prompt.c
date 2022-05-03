// gcc -s -O2 -o "$HOME/bin/`uname -m`/prompt" prompt.c

#include <sys/sysinfo.h>
#include <unistd.h>
#include <limits.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#define ArrayCount(x) (sizeof(x) / sizeof((x)[0]))

int main(void)
{
    struct sysinfo SysInfo = {0};
    sysinfo(&SysInfo);

    int Hours = SysInfo.uptime / 3600;
    int Minutes = (SysInfo.uptime / 60) % 60;
    int Seconds = SysInfo.uptime % 60;

    char HostName[HOST_NAME_MAX + 1];
    gethostname(HostName, ArrayCount(HostName));
    HostName[ArrayCount(HostName) - 1] = 0;

    char *HomeDirectory = getenv("HOME");
    char *CurrentDirectory = getcwd(NULL, 0);

    char PromptDir[PATH_MAX];
    {
        char *Cursor = PromptDir;
        if(memcmp(HomeDirectory, CurrentDirectory, strlen(HomeDirectory)) == 0)
        {
            *Cursor++ = '~';
            CurrentDirectory += strlen(HomeDirectory);
        }

        strcpy(Cursor, CurrentDirectory);
    }

    printf("[%d:%02d:%02d] %s %s", Hours, Minutes, Seconds, HostName, PromptDir);

    return(0);
}
