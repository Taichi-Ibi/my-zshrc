. "$HOME/.local/bin/env"
eval "$(anyenv init - zsh)"
eval "$(direnv hook zsh)"
export PATH="/usr/local/opt/python@3.11/bin:/usr/sbin:/sbin:$PATH"

# Brew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export PATH="/opt/homebrew/bin:$PATH"

# CPU Architecture
if (( $+commands[arch] )); then
  alias a64="exec arch -arch arm64e '$SHELL'"
  alias x64="exec arch -arch x86_64 '$SHELL'"
f

# History
HISTSIZE=1000
SAVEHIST=1000

# Options
setopt auto_pushd # cd - で以前いたディレクトリに移動
setopt correct # コマンドのスペルミスを指摘
setopt extended_glob # 高機能なワイルドカード展開を使用する
setopt hist_ignore_all_dups # 同じコマンドをhistoryに残さない
setopt hist_reduce_blanks # historyに保存するときに余分なスペースを削除する
setopt list_packed # 補完候補を詰めて表示
setopt print_eight_bit # 日本語表示設定
setopt share_history # 同時に起動しているzshの間でhistoryを共有する
setopt PROMPT_SUBST # Gitブランチの表示

# Prompt
# eval "$(starship init zsh)"

# External Tools #
## Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

## Node.js
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/usr/local/bin:$PATH"
function runs_on_ARM64() { [[ `uname -m` = "arm64" ]]; }
function runs_on_X86_64() { [[ `uname -m` = "x86_64" ]]; }

## VSCode
alias cdd="code ."

## Brew
BREW_PATH_OPT="/opt/homebrew/bin"
BREW_PATH_LOCAL="/usr/local/bin"
function brew_exists_at_opt() { [[ -d ${BREW_PATH_OPT} ]]; }
function brew_exists_at_local() { [[ -d ${BREW_PATH_LOCAL} ]]; }

# API Keys #
if [ -f ~/.env ]; then
  source ~/.env
fi

# Alias #
## vim
alias nv='nvim'

## Network
alias myip='ifconfig | grep "inet " | head -n 2 | tail -n 1 | cut -d" " -f2'

## zsh(zshいじる趣味が無いなら要らない)
alias cz='bat $HOME/Dev/my-zshrc/.zshrc'
alias lz='less $HOME/Dev/my-zshrc/.zshrc'
alias sz='source ~/.zshrc'
alias l='less'
alias oz='open $HOME/Dev/my-zshrc/.zshrc'
alias oe='open ~/.env'
alias vz='nvim  $HOME/Dev/my-zshrc/.zshrc'
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"
alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"

## Commands
alias md='mkdir -p'
alias th='touch'
alias ls='eza -G' # ls系
alias la='eza -a'
alias ll='eza -lh'
alias c='bat'
alias cl='clear' # よく使うコマンド(ゆくゆくはAtoZまで埋めたい！)
alias pbc='pbcopy'
alias pbp='pbpaste'
alias rm='rm -i' # 処理確認
alias mv='mv -i'
alias cp='cp -i'

## 検索
alias ggl="google"
alias h='history 0 | tail -r | fzf --reverse --height 50% --no-sort \
    | cut -c 8- | pbcopy'

## Python
alias da='deactivate'
alias pip='pip3'
alias pir='pip install -r requirements.txt'
alias pvv='/opt/homebrew/bin/python3.11 -m venv .venv'
alias py='python3'
alias python='python3'
alias sva='. .venv/bin/activate'

## Docker
alias dk='docker'
alias dsp='echo y | docker system prune'

## Git
### Basic
alias gcl='git clone'
alias prn='gh pr new'
alias gto='git open'
### Branch
alias gb='git branch'
alias gco='git checkout'
alias gmg='git merge'
alias gpl='git pull'
### Commit
alias ga='git add'
alias gaa='git add -A && git status --short'
alias gcm='git commit -m '
alias gop='git-open'
alias gp='git push'
### Search
alias gg='git grep'
### Stash
alias gsl='git stash list'
alias gst='git stash'
alias gsp='git stash pop'
alias oc='opencommit'
### Status
alias gd='git diff'
alias gga="git log -20 --graph --date-order --all --pretty=format:'%h %C(green)%ad% C(cyan reverse)%cn%C(reset) %C(white bold)%s %C(red reverse)%w(80)%d' --date=short"
alias gl='git log'
### Other
alias grh='git reset --hard'
alias gpn='gh pr new'
gcb() {
    git checkout -b "$1" && git push -u origin "$1"
}
# git config --global --add --bool push.autoSetupRemote true

## Her
alias awaken='sh $HOME/dev/her/scripts/awaken.sh' # 起動
alias memory='sh $HOME/dev/her/scripts/memory.sh' # 会話履歴表示
alias refresh='truncate -s 0 $HOME/dev/her/logs/history.jsonl' # 会話履歴クリア
alias llm='sh $HOME/dev/her/scripts/her.sh llm ' # モデル選択
alias flm='sh $HOME/dev/her/scripts/her.sh flm '
alias slm='sh $HOME/dev/her/scripts/her.sh slm '

## Cloud
[ -f ~/.zcloud ] && source ~/.zcloud
alias tf='terraform'

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

## bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

## AWD
alias awsp="source _awsp"

## Deploy Script
dep() (
  cd $HOME/Dev/my-zshrc && ./deploy.sh
)

## organize 
org() (
  cd ~/Downloads && organize run organize.yaml
)

## estyle
alias estyledb='cd $HOME/dev/estyledb && ./estyledb employees'

fm() {
    local dst
    dst=$(mktemp)
    vifm --choose-dir="$dst" "$@"
    if [ -f "$dst" ]; then
        cd "$(cat "$dst")"
        rm -f "$dst"
    fi
}
alias mute='./.build/release/mute-input'
alias unmute='./.build/release/mute-input unmute'