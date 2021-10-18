HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

unsetopt beep

bindkey -e

# Aliases
alias dc='docker-compose'
alias j='just'
alias t='tmux'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# Plugins
source /usr/share/zsh/scripts/zplug/init.zsh

zplug romkatv/powerlevel10k, as:theme, depth:1

zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(keychain --eval --quiet $HOME/.ssh/id_ed25519)
