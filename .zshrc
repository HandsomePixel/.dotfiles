# Enable history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
setopt hist_ignore_all_dups

# Add ~/.local/bin to path
export PATH="$HOME/.local/bin:$PATH"

# Add /usr/local/bin and /usr/local/sbin to path (both managed by brew)
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Use gnu coreutils instead of the pre-installed macOS binaries
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Use gnu sed instead of the pre-installed macOS binary
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Add java runtime to path (not from brew)
export PATH="$PATH:/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin"

# Add ImageMagick to path
export PATH="$PATH:$MAGICK_HOME/bin"

# Set IMAGE_MAGICK environment variable
export MAGICK_HOME="$HOME/.local/bin/ImageMagick"*

# Set ImageMagick DYLD_LIBRARY_PATH environment variable
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib"

# Change default GOPATH
export GOPATH="$HOME/.local/go"

# Change default node path
export NPM_CONFIG_PREFIX="$HOME/local/node_modules"

# Change default editor
export EDITOR="nvim"

# Set zsh to use emacs keybinds, because I like them
bindkey -e

# Load zsh history substring search, and bind it
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Zsh plugin directory
ZSH_PLUGINS="$HOME/.zsh_plugins"

# Source zsh plugins
source "$ZSH_PLUGINS/zsh-async-git-prompt/async-git-prompt.plugin.zsh"
source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

# Zsh prompt
PROMPT='%B%F{yellow}%~
%F{blue}%n %(?.%F{green}.%F{red})→%f%b '

# Alias for ls
alias cls="ls --format=single-column --color=always --indicator-style=classify"

# Alias for neovim
alias nv='nvim'

# Function for curl
ccrl() {
  local orig_dir=`pwd`
  local url=$1
  local target_dir=$2
  if [ $# -gt 1 ]; then
    cd $target_dir
  fi
  curl -kLO $url
  cd $orig_dir
}



# Function for batch converting pdf files to svg
  function b_pdf2svg {
    res=$(find *.pdf -maxdepth 0 | wc -l | sed 's/^ *//')
    echo "found $res results"
    i=1

    cd "$1"

    for FILE in *.pdf; do
      pdf2svg "$FILE" "$FILE".svg
      echo -n "["
      for ((j=0; j<i; j++)) ; do echo -n ' '; done
      echo -n '=>'
      for ((j=i; j<$res; j++)) ; do echo -n ' '; done
      echo -n "] $i / $res" $'\r'
      ((i++))
    done
  }
