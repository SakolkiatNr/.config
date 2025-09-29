export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME=""

plugins=(git zsh-syntax-highlighting
	    zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
# For a full list of active aliases, run `alias`.

# To customize prompt, run `p10k configure` 
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# git stuffs
alias ga="git add"
alias gc="git commit"
alias gs="git status --short"
alias gl='git log --graph --pretty=format:"%C(yellow)%h%C(reset) %an %C(green)%ar%C(reset) %C(red)%d%C(reset) %n%s%n "'
alias grs="git reset"
alias gd="git diff"
alias gcl="git clone"
alias gp="git push"

