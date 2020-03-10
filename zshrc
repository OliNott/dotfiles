ZSH=$HOME/.oh-my-zsh

#Loading custom fonts
source ~/fonts/*.sh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# General config
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

# Prompts
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh context dir virtualenv vcs)
else
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir virtualenv vcs)
fi
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator battery custom_now_playing time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=..
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460\uF460\uF460 "

# Custom segment "now playing"
POWERLEVEL9K_CUSTOM_NOW_PLAYING='~/code/OliNott/dotfiles/bin'

# Colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
POWERLEVEL9K_CUSTOM_NOW_PLAYING_BACKGROUND='blue'
POWERLEVEL9K_CUSTOM_NOW_PLAYING_FOREGROUND='black'
POWERLEVEL9K_OS_ICON_BACKGROUND='white'
POWERLEVEL9K_OS_ICON_FOREGROUND='black'
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_TIME_FOREGROUND='black'

# Battery colors
POWERLEVEL9K_BATTERY_CHARGING='107'
POWERLEVEL9K_BATTERY_CHARGED='blue'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='50'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='blue'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='white'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='107'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='white'
POWERLEVEL9K_BATTERY_LOW_BACKGROUND='red'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='white'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='white'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='214'

# VCS colors
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='cyan'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='white'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'

# Useful plugins for Rails development with Sublime Text
plugins=(gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

alias ls='colorls --dark --sort-dirs'
alias ll='colorls --dark --sort-dirs --long --report'

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
