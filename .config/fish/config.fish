# My advanced fish shell configuration file for Ubuntu.

###########################################
###            EXPORT                   ###
###########################################
set fish_greeting                       # Suppresses fish's intro message.

# XDG stuff rules
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_RUNTIME_DIR /run/user/(id -u)


set -gx TERM "xterm-256color"
set -gx COLORTERM truecolor

if type -q brave
    set -gx BROWSER "brave"
else if type -q firefox
    set -gx BROWSER "firefox"
end

type -q nvim && set -gx EDITOR "nvim" || set -gx EDITOR "vim"

###########################################
###       ADDING TO THE PATH            ###
###########################################
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $XDG_DATA_HOME/{cargo/bin,go/bin} $HOME/Applications $fish_user_paths


###########################################
###  CURSOR SHAPE IN DIFFERENT VI MODE  ###
###########################################
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

###########################################
###   AUTOCOMPLETE && HIGHLIGHT COLORS  ###
###########################################
set -l foreground white
set -l selection 44475a
set -l comment 6272a4
# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command green
set -g fish_color_keyword pink
set -g fish_color_quote yellow
set -g fish_color_redirection $foreground
set -g fish_color_end orange
set -g fish_color_error red
set -g fish_color_param cyan
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator green
set -g fish_color_escape pink
set -g fish_color_autosuggestion comment
set -g fish_color_cancel red --reverse
set -g fish_color_option orange
set -g fish_color_status red

# Default Prompt Colors
set -g fish_color_cwd cyan
set -g fish_color_host green
set -g fish_color_host_remote green
set -g fish_color_user purple

# Completion Pager Colors
set -g fish_pager_color_progress comment
set -g fish_pager_color_background
set -g fish_pager_color_prefix cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
set -g fish_pager_color_selected_prefix cyan
set -g fish_pager_color_selected_completion $foreground
set -g fish_pager_color_selected_description $comment
set -g fish_pager_color_secondary_background
set -g fish_pager_color_secondary_prefix cyan
set -g fish_pager_color_secondary_completion $foreground
set -g fish_pager_color_secondary_description $comment

###########################################
###               ALIASES               ###
###########################################
alias l="ls -Alh --color=auto --group-directories-first"
alias ls="eza -al --color=auto --icons --group-directories-first"
alias pn="pnpm"
alias cursor="cursor-0.41.2x86_64.AppImage --no-sandbox"
abbr -ag vi nvim


###########################################
###               PROMPT                ###
###########################################
function fish_prompt --description 'Write out the prompt'
	set -l last_pipestatus $pipestatus
	set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

	if test $__fish_last_status -eq 0
		printf "%s%s  " (set_color $fish_color_host) (set_color normal)
	else
		printf "%s✘%s  " (set_color --bold $fish_color_status) (set_color normal)
	end

	# PWD
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal

	# Git prompt
	# printf '%s ' (fish_vcs_prompt)
	if test (fish_vcs_prompt)
		set_color f2510c
		printf ' [ %s] ' (git branch --show-current)
		set_color normal
	else
		echo -n ' '
	end

	set -l status_color (set_color $fish_color_status)
	set -l statusb_color (set_color --bold $fish_color_status)
	set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
	echo -n $prompt_status
	set_color normal

	if test $__fish_last_status -eq 0
		printf ""
	else
		printf " "
	end
end


###########################################
###               LOAD                  ###
###########################################
### Run zoxide | The rust replacement for cd ###
type -q zoxide && zoxide init fish | source


