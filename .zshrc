export PATH="$HOME/Applications:$HOME/.cargo/bin:$PATH"

HISTSIZE=400
SAVEHIST=400

HISTFILE=~/.zsh/history

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -U colors && colors

# Robbyrussell Prompt With Git Branch Integration
get_git_branch() {
	if git rev-parse --is-inside-work-tree &> /dev/null; then
		echo "$(git symbolic-ref --short HEAD 2> /dev/null)"
	fi
}

update_git_branch() {
	GIT_BRANCH=$(get_git_branch)
}

precmd_functions+=("update_git_branch")

set_prompt() {
	local git_branch=""
	if [ -n "$GIT_BRANCH" ]; then
		git_branch=" [  $GIT_BRANCH]"
	fi
	PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%~%F{202}$git_branch%{$reset_color%} "
}

precmd_functions+=("set_prompt")



source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias l="ls -Alh --color=auto --group-directories-first"
alias ls="ls -Alh --color=auto --group-directories-first"
alias ls="exa -al --color=auto --icons --group-directories-first"
alias pn="pnpm"
alias cursor="cursor-0.41.2x86_64.AppImage --no-sandbox"

eval "$(zoxide init zsh)"
export PATH=$HOME/.local/bin:$PATH
fpath+=${ZDOTDIR:-~}/.zsh_functions
