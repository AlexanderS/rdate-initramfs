# rdate-initramfs

Run rdate in your initramfs, before encrypted partitions are mounted. This is
usefull, if you want to run time sensitive applications like
[wireguard](https://github.com/r-pufky/wireguard-initramfs/) in your initramfs
and your device has not hardware clock.


## Requirements

You need to have a time server, that supports [RFC
868](https://www.rfc-editor.org/rfc/rfc868.html). This is **not** NTP. It's a
simple protocol over port 37. You can check with `busybox rdate -p TIMESERVER`,
if your server supports this protocol. If you want to host this server by
yourself, you can use the build-in time server of inetd` or `xinetd`.


## Usage

1. Install the scripts with:

```
make install
```

2. Configure your time server in `/etc/rdate-initramfs/rdate.conf`.

3. Rebuild your initramfs:

```
update-initramfs -k all -u
```

4. reboot


## License

MIT License
