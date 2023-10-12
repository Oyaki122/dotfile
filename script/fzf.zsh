# fgc (git checkout) - checkout git branch including remote branches
# ref: https://qiita.com/kamykn/items/aa9920f07487559c0c7e
fgc() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# flog - git commit browser
# ref: https://qiita.com/kamykn/items/aa9920f07487559c0c7e
flog() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(#C0C0C0)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
              (grep -o '[a-f0-9]\{7\}' | head -1 |
              xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
              {}
              FZF-EOF
             "
}

# fd - cd to selected directory
# https://qiita.com/kamykn/items/aa9920f07487559c0c7e
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# zplugなどでzをインストールしとく
# zplug "rupa/z", use:z.sh

fzf-z-search() {
    local res=$(z | sort -rn | cut -c 12- | fzf)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}

zle -N fzf-z-search
bindkey '^f' fzf-z-search

# frrun

rrun() {
    local pkg
    local exe
    pkg=$(ros2 pkg list | fzf) &&
    exe=$(ros2 pkg executables "$pkg" | awk '{print $2}' | fzf) &&
    ros2 run "$pkg" "$exe" "$*"
}

# frlaunch

rlaunch(){
    local pkg
    local launch
    pkg="$(ros2 pkg list | fzf)" &&
    launch=$(find ~/ros2_ws/install/${pkg}/share/${pkg}/ -name '*launch.py' | \
            awk -F/ '{print $NF}' | fzf) &&
    ros2 launch "$pkg" "$launch" "$@"
}
