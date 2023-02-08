# SETUP

# add ```/sbin``` to ```$PATH```

```export PATH=$PATH:/usr/sbin```
 
```sh
# single quotes prevent variable expansion
sudo echo 'export PATH="/sbin:$PATH"' >> ~/.bashrc
```
