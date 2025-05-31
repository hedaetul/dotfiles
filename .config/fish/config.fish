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
set -U fish_user_paths \
    /home/linuxbrew/.linuxbrew/bin \
    $HOME/.local/bin \
    $XDG_DATA_HOME/{cargo/bin,go/bin,nvm/v22.16.0/bin} \
    $HOME/Applications \
    $HOME/Applications/flutter/bin \
    $HOME/.pub-cache/bin \
    $HOME/Android/Sdk/cmdline-tools/latest/bin \
    $HOME/Android/Sdk/platform-tools \
    $fish_user_paths 
    
  

#set -U fish_user_paths $HOME/.local/bin $XDG_DATA_HOME/{cargo/bin,go/bin,nvm/v22.13.1/bin} $HOME/Applications $HOME/Applications/flutter/bin $HOME/.pub-cache/bin $fish_user_paths
#set -U fish_user_paths $fish_user_paths $XDG_DATA_HOME/cargo/bin $XDG_DATA_HOME/go/bin $XDG_DATA_HOME/nvm/v20.17.0/bin $HOME/Applications


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
abbr -ag vi nvim
abbr -ag pn pnpm
abbr -ag ads android-studio
abbr -ag py python

alias l="ls -Alh --color=auto --group-directories-first"
alias ls="eza -al --color=auto --icons --group-directories-first"
alias cursor="~/Applications/cursor/Cursor-0.50.5-x86_64.AppImage"
alias postman="~/Applications/Postman/Postman"
alias firefox-nightly="/opt/firefox-nightly/firefox"
alias zen-browser="flatpak run app.zen_browser.zen"
alias discord="/opt/Discord/Discord"
alias firefox="flatpak run org.mozilla.firefox"
alias qbittorent="flatpak run org.qbittorrent.qBittorrent"
alias android-studio="~/Applications/android-studio/bin/studio"

###########################################
###               PROMPT                ###
###########################################
function fish_prompt --description 'Minimal, attractive prompt with error indicator'
    # Store the last command status right at the start
    set -l last_status $status

    # Username: changes color based on last command status
    if test $last_status -ne 0
        set_color --bold red
        printf "王%s" (whoami)
    else 
        set_color --bold yellow
        printf "王%s" (whoami)
    end
    set_color normal

    # ' in ' in gray
    set_color brgrey
    printf " in "
    set_color normal

    # Directory: bold, underlined blue
    set_color --bold --underline blue
    printf "%s" (prompt_pwd)
    set_color normal

    # Only show git section in square brackets if in a git repo
    if test (fish_vcs_prompt)
        set_color brgrey
        printf " on "
        set_color red
        printf "[ %s]" (git branch --show-current)
        set_color normal
        printf " "
    end

    # Newline and a stylish symbol for the prompt
    printf "\n"
    if test $last_status -ne 0
        set_color brred
        printf "󰡜  ︰"
    else
        set_color green
        printf "󰡜  ︰"
    end
    set_color normal
end


###########################################
###               LOAD                  ###
###########################################
### Run zoxide | The rust replacement for cd ###
type -q zoxide && zoxide init fish | source

