run CONTAINER IMAGE_NAME:
    docker run \
        --name={{CONTAINER}} \
        -ti \
        --tmpfs /run \
        --tmpfs /run/lock \
        --tmpfs /tmp \
        --cap-add SYS_ADMIN \
        --device=/dev/fuse \
        --security-opt apparmor:unconfined \
        --security-opt seccomp:unconfined \
        -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
        -v /lib/modules:/lib/modules:ro \
        -d {{IMAGE_NAME}} 

enter CONTAINER:
    docker start {{CONTAINER}}
    docker exec -it {{CONTAINER}} /bin/bash
