# ============================================================
#  .zshrc
# ============================================================
#  セクション構成:
#    1. System        – アーキテクチャ判定・Homebrew
#    2. PATH          – 各ツールの PATH 追加
#    3. Environment   – EDITOR 等の汎用環境変数
#    4. History       – 履歴まわりの設定
#    5. Options       – setopt 系
#    6. Prompt        – Starship
#    7. Completions   – compinit & 各ツールの補完
#    8. Plugins       – zsh-autosuggestions / zsh-syntax-highlighting
#    9. Tools         – anyenv, direnv, nvm, bun, gcloud 等
#   10. Secrets       – .env の読み込み
#   11. Aliases       – エイリアス
#   12. Functions     – シェル関数・スクリプト
# ============================================================

# ----------------------------------------------------------
# 1. System
# ----------------------------------------------------------
runs_on_ARM64()  { [[ $(uname -m) = "arm64"  ]]; }
runs_on_X86_64() { [[ $(uname -m) = "x86_64" ]]; }

export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"

# ----------------------------------------------------------
# 2. PATH  ※ 上に書いたものほど優先度が高い
# ----------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/python@3.13/bin:$PATH"
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/sbin:/sbin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ----------------------------------------------------------
# 3. Environment
# ----------------------------------------------------------
export EDITOR="nvim"

# ----------------------------------------------------------
# 4. History
# ----------------------------------------------------------
HISTSIZE=1000
SAVEHIST=1000

# ----------------------------------------------------------
# 5. Options
# ----------------------------------------------------------
setopt correct              # コマンドのスペルミスを指摘
setopt extended_glob        # 高機能なワイルドカード展開
setopt hist_ignore_all_dups # 重複コマンドを履歴に残さない
setopt hist_reduce_blanks   # 履歴保存時に余分な空白を削除
setopt list_packed          # 補完候補を詰めて表示
setopt print_eight_bit      # 日本語表示
setopt share_history        # zsh 間で履歴を共有
setopt PROMPT_SUBST         # プロンプト内の変数展開

# ----------------------------------------------------------
# 6. Prompt
# ----------------------------------------------------------
eval "$(starship init zsh)"

# ----------------------------------------------------------
# 7. Completions  ※ compinit は補完定義の後に実行
# ----------------------------------------------------------
# bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Google Cloud SDK
[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ] && source "$HOME/google-cloud-sdk/completion.zsh.inc"

# nvm (bash_completion)
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# ----------------------------------------------------------
# 8. Plugins  ※ syntax-highlighting は必ず最後に読み込む
# ----------------------------------------------------------
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ----------------------------------------------------------
# 9. Tools
# ----------------------------------------------------------
# anyenv
eval "$(anyenv init - zsh)"

# direnv
eval "$(direnv hook zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"

# Google Cloud SDK (PATH)
[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ] && source "$HOME/google-cloud-sdk/path.zsh.inc"

# ----------------------------------------------------------
# 10. Secrets
# ----------------------------------------------------------
[ -f ~/.env ] && source ~/.env

# ----------------------------------------------------------
# 11. Aliases
# ----------------------------------------------------------
# よく使うコマンド
alias cl='cl'
alias rm='rm -i'
alias cc='claude'
alias pbc='pbcopy'
alias pbp='pbpaste'
alias yz='yazi'
alias lg='lazygit'
alias ls='eza -G'
alias la='eza -a'
alias ll='eza -lh'

# zshrc 管理
alias oz='open $HOME/dev/my-zshrc/.zshrc'
alias oe='open ~/.env'
alias sz='source ~/.zshrc'

# ネットワーク
alias myip='ifconfig | grep "inet " | head -n 2 | tail -n 1 | cut -d" " -f2'

# ----------------------------------------------------------
# 12. Functions
# ----------------------------------------------------------
dep() (
  cd "$HOME/dev/my-zshrc" && ./deploy.sh
)

# ----------------------------------------------------------
# 12. Git
# ----------------------------------------------------------
alias gaa='git add -A'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
