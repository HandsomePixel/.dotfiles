# Enable history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
setopt hist_ignore_all_dups

# Change default path
export PATH="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin:/usr/local/bin:$PATH"

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
PROMPT='%F{yellow}%~ %F{blue}%% %F{white}'

# Alias to merge pdf files
alias mrgpdf="gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=Merged.pdf"

# Alias for neovim
alias nv='nvim'

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
