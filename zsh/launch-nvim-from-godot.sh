#!/bin/bash
LINE=$1
FILE=$2

SERVER="/tmp/nvim-godot-server"

# Check if Neovim is actually listening on the socket
if flatpak-spawn --host nvim --server "$SERVER" --remote-expr "1" 2>/dev/null; then
    # Server is running, send file to it
    flatpak-spawn --host nvim --server "$SERVER" --remote-send "<C-\><C-n>:edit $FILE<CR>:$LINE<CR>"
else
    # Server not running, clean up old socket and start fresh
    rm -f "$SERVER"
    flatpak-spawn --host ghostty -e nvim --listen "$SERVER" "+$LINE" "$FILE" &
fi

