https://superuser.com/questions/1462581/unable-to-shutdown-reboot-my-debian-10-server


# systemctl reboot
```sh
sudo cat << EOF > /bin/reboot
#!/bin/bash
sudo systemctl reboot
EOF
sudo chmod +x /bin/reboot
```

# systemctl poweroff
```sh
sudo cat << EOF > /bin/shutdown
#!/bin/bash
sudo systemctl poweroff
EOF
sudo chmod +x /bin/shutdown
```
