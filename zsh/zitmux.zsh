#!/usr/bin/env bash
# Get the directory from zoxide (if passed as an argument)
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(zoxide query -i)
fi

# Exit if no directory is selected
if [[ -z "$selected" ]]; then
    echo "No directory selected. Exiting."
    exit 0
fi

# Generate a base session name from the selected directory
selected_name=$(basename "$selected" | tr . _)

# If we're outside tmux, append a unique identifier to prevent conflicts
if [[ -z $TMUX ]]; then
    # Use terminal device number to make session name unique per terminal
    terminal_id=$(tty | sed 's/\/dev\///' | tr '/' '_')
    selected_name="${selected_name}_${terminal_id}"
fi

# Check if tmux is running
tmux_running=$(pgrep tmux)

# If tmux is not running and you're not inside tmux, start a new session
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    echo "Starting a new tmux session: $selected_name"
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

# If tmux is running but session doesn't exist, create it
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    echo "Creating a detached tmux session: $selected_name"
    tmux new-session -ds "$selected_name" -c "$selected"
fi

# Attach or switch to the tmux session
echo "Switching to tmux session: $selected_name"
if [[ -n $TMUX ]]; then
    # Already inside tmux: just switch to the session
    tmux switch-client -t "$selected_name"
else
    # Outside tmux: attach to the session
    tmux attach-session -t "$selected_name"
fi


