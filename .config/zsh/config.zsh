# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/scripts/date_rename.zsh
# Source all scripts in ~/.config/zsh/script
if [ -d "$HOME/.config/zsh/scripts" ]; then
  for script in "$HOME/.config/zsh/scripts"/*.sh; do
    source "$script"
  done
fi
export PATH=/home/alpha/.local/bin:$PATH
export PATH=/home/alpha/.appimg:$PATH
# --- FZF Configuration ---
source <(fzf --zsh)

# Use fdfind (Debian) or fd
if (( $+commands[fdfind] )); then
    # Default and ALT-C: Include hidden folders for navigation
    export FZF_DEFAULT_COMMAND='fdfind --hidden --strip-cwd-prefix'
    export FZF_ALT_C_COMMAND='fdfind --type d --hidden --strip-cwd-prefix'
    
    # CTRL-T: Files only, NO hidden files/folders
    export FZF_CTRL_T_COMMAND='fdfind --type f --strip-cwd-prefix'
    
    # TAB completion: Follows default (includes hidden)
    _fzf_compgen_path() { fdfind --hidden . "$1" }
    _fzf_compgen_dir() { fdfind --type d --hidden . "$1" }
elif (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix'
    export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix'

    export FZF_CTRL_T_COMMAND='fd --type f --strip-cwd-prefix'

    _fzf_compgen_path() { fd --hidden . "$1" }
    _fzf_compgen_dir() { fd --type d --hidden . "$1" }
fi
