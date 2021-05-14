# Description
An overlay provided by xmake-io to provide packages for xmake and xmake-related things.

# Installation
You see that `xmake-io.conf` in the repo right? Ok, good. Now here's what you need to do.<br> 
Check out `/etc/portage/repos.conf`.<br>
Now you have 2 options:<br>
- If it is a file, append the contents of `xmake-io.conf` to it.
- If it is a directory, copy `xmake-io.conf` to it.

After that, all you need to do is `sudo emerge --sync xmake-io-overlay`

# Software
Currently, here is what is included:
- [`dev-util/xmake`](https://github.com/xmake-io/xmake) - A cross-platform build utility based on Lua.
