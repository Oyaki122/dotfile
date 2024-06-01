# ----------------------------
# basic
# ----------------------------
# コマンド履歴の管理
HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

export PATH=$PATH:"/home/linuxbrew/.linuxbrew/bin"
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u

export PATH=$PATH:"/home/oyaki/.local/bin"
export PATH=$PATH:"/usr/local/bin"
# HomebrewのGitを使うパス
export PATH=/usr/local/bin/git:$PATH

export RISCV=/home/oyaki/.riscv
export PATH=$RISCV/bin:$PATH

# export PATH=$PATH:"/home/oyaki/.platformio/penv/bin/pio"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias l='exa -l -h -@ -m --icons --git --time-style=long-iso --color=automatic --group-directories-first'
alias la='l -a'
alias a='cd ../'
alias aa='cd ../../'
alias aaa='cd ../../../'
alias aaaa='cd ../../../../'
alias aaaaa='cd ../../../../../'

alias swap='sudo swapoff -a && sudo swapon -a'
alias cclear='sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"'

source /opt/ros/humble/setup.zsh
source ~/sick_ws/install/setup.zsh
source ~/script/ros.zsh
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
export ROS_DOMAIN_ID=1


export NVM_DIR="$HOME/.nvm"
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# z command
. `brew --prefix`/etc/profile.d/z.sh 

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse'

source ~/script/fzf.zsh

# java
export JAVA_HOME="/usr/lib/jvm/java-19-openjdk-amd64/"
export PATH=$PATH:$JAVA_HOME

# tex
export MANPATH=$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man 
export INFOPATH=$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info
export PATH=$PATH:/usr/local/texlive/2023/bin/x86_64-linux

# nvim switcher
alias rnvim="NVIM_APPNAME=richNvim nvim"
alias snvim="NVIM_APPNAME=snvim nvim"
alias cnvim="NVIM_APPNAME=cnvim nvim"

function nvims() {
  items=("default" "richNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

export PATH=$PATH:/opt/gradle/gradle-8.1.1/bin
export PATH=$PATH:/opt/st/stm32cubeclt/STLink-gdb-server/bin

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# opam configuration
[[ ! -r /home/oyaki/.opam/opam-init/init.zsh ]] || source /home/oyaki/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# cargo
. "$HOME/.cargo/env"
fpath+=${ZDOTDIR:-~}/.zsh_functions
