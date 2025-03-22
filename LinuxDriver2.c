#include <stdio.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdint.h>

#define IOCTL_DRAW _IOW('G', 1, struct draw_command)

struct draw_command {
    uint32_t x, y;
    uint8_t color;
};

int main() {
    int fd = open("/dev/risc6gpu", O_RDWR);
    if (fd < 0) {
        perror("Failed to open /dev/risc6gpu");
        return 1;
    }

    // Draw a pixel at (100, 100) with color 255 (white)
    struct draw_command cmd = {100, 100, 255};
    ioctl(fd, IOCTL_DRAW, &cmd);

    close(fd);
    return 0;
}
