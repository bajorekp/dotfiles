# Profiles zsh startup
# zmodload zsh/zprof

source ~/Developer/dotfiles/zsh/.profile
[[ -s ~/Developer/dotfiles/zsh/corpo.profile ]] && source ~/Developer/dotfiles/zsh/corpo.profile || true
source ~/Developer/dotfiles/zsh/mise.profile
source ~/Developer/dotfiles/zsh/.zsh_profile

# zprof
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# poetry
export PATH="$HOME/.local/bin:$PATH"
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# android
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Cursor CLI
export PATH="$HOME/.local/bin:$PATH"
# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opencode
export PATH="$HOME/.opencode/bin:$PATH"
