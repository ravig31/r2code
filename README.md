# r2code

Open a remote project in your local machines’s VS Code via a reverse SSH tunnel.

## Usage
The initial `ssh` setup is left to the user, assumes a connection has been established both ways (host ↔ remote) and the respective aliases are in the `.ssh/config` file.

For best experience a passwordless connection using  `ssh-copy-id` is recommended.

Once that is complete, set these variables in the shell script
- `HOST_ALIAS`	- SSH alias for your host on the remote machine 
- `REMOTE_ALIAS` - 	Alias on host machine for this remote

Then use like you would use `code` normally.

```bash
r2code [path] #path defaults to the current directory.
```
### Example:

```bash
r2code ~/main/project
```

## How it works
- Picks a free reverse-SSH port.
- Connects back to your host with `HOST_ALIAS`.
- Runs `code --remote ssh-remote+<REMOTE_ALIAS> <path>` on your host machine.

Pretty simple, but convenient!


## Setup
```bash
    git clone https://github.com/ravig31/r2code.git # or download the script 
    sudo cp /path/to/r2code.sh /usr/local/bin/r2code # copy into path
    sudo chmod +x /usr/local/bin/r2code # change permissions
```
