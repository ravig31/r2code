# r2code

Open a remote project in your Mac’s VS Code via a reverse SSH tunnel.
Requires passwordless SSH both ways (Mac ↔ remote).

## Usage
```bash
r2code [path] #path defaults to the current directory.
```
### Example:

```bash
r2code ~/main
```
## How it works
- Picks a free reverse-SSH port.
- Connects back to your host with `HOST_ALIAS`.
- Runs `code --remote ssh-remote+<REMOTE_ALIAS> <path>` on your host machine.

## Config (override with env vars)
- HOST_ALIAS	SSH alias for your host on remote machine 
- REMOTE_ALIAS	Alias on host machine for this remote

## Setup
```bash
    sudo cp r2code.sh /usr/local/bin/r2code
    sudo chmod +x /usr/local/bin/r2code
```
