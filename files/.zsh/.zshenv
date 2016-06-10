source ~/.zsh/.zshenv.local

# rbenv
export PATH=$HOME/.rbenv/bin:$HOME/.cargo/bin:$PATH
eval "$(rbenv init -)"

# cargo
export PATH=$HOME/.cargo/bin:$PATH

# PATHに対してws内の各種ディレクトリを追加
export PATH=$HOME/ws/utils:$HOME/ws/local/bin:$PATH

# git-forgot
export GIT_FORGOT_DIR="$HOME/ws/dev/* $HOME/*"

# racer
export RUST_SRC_PATH="$HOME/ws/local/rust/src"
