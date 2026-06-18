#!/bin/bash
LINE=$1
FILE=$2
echo "Line: $LINE" >> /tmp/nvim-open.log
echo "File: $FILE" >> /tmp/nvim-open.log
echo "Opening..." >> /tmp/nvim-open.log
ghostty -e nvim "+call cursor($LINE, 0)" "$FILE" &
echo "Done" >> /tmp/nvim-open.log
