// https://unix.stackexchange.com/a/498065
#include <unistd.h>
#include <poll.h>
#include <sys/ioctl.h>
#ifdef __sun
#include <sys/filio.h>
#endif
#include <err.h>

int main(int ac, char **av){
        int r; struct pollfd pd = { 0, POLLIN };
        if(poll(&pd, 1, -1) < 0) err(1, "poll");
        if(ioctl(0, FIONREAD, &r)) err(1, "ioctl(FIONREAD)");
        if(r < 1) return 1;
        if(++av, --ac < 1) return 0;
        execvp(*av, av);
        err(1, "execvp %s", *av);
}
