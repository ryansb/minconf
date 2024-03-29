# vim: fdm=marker
# vim bindings
setw -g mode-keys vi

setw -g aggressive-resize on

unbind C-a
# unbind C-b because of VIM 
unbind C-b

set -g prefix C-a
bind a send-prefix

# And I was blaming VIM... F*ck!
set-option -sg escape-time 10

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind-key -r C-h select-window -t :-
bind-key -r C-l select-window -t :+

bind-key a send-prefix
unbind r
bind r source-file ~/.tmux.conf

# Get to the last active window
bind-key C-a last-window

unbind ^P
bind ^P previous-window
unbind p
bind p previous-window
unbind BSpace
bind BSpace previous-window

# _ Handy options {{{

# Start numbering windows at 1
set -g base-index 1

set -g history-limit 10000

# }}}

# Mouse scrolling within 'copy-mode'
#setw –g mode-mouse on

setw -g automatic-rename

# Set window notifications
setw -g monitor-activity on
set -g visual-activity on

set-option -g status-utf8 on
set -g status-interval 1

bind-key v split-window -h
bind-key s split-window

# pane movement
bind-key C-j command-prompt -p "join pane from:"  "join-pane -s '%%'"
bind-key C-s command-prompt -p "send pane to:"  "join-pane -t '%%'"
bind C-b break-pane

# Bind escape to copy-mode
unbind [
bind Escape copy-mode
