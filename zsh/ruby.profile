# Adds RVM to PATH for scripting
export PATH="$HOME/.rvm/bin:$PATH"
rvm_silence_path_mismatch_check_flag=1

fpath+="$HOME/.rvm/scripts/zsh/Completion"

# Loads RVM as a function. It adds 0.1s to shell startup
source "$HOME/.rvm/scripts/rvm"

# Force required openssl library version
# This is required for gem compilation, i.e. puma, nokogiri
OPENSSL_1_1=$HOMEBREW_PREFIX/opt/openssl@1.1
export PATH="$OPENSSL_1_1/bin:$PATH"
export LDFLAGS="-L$OPENSSL_1_1/lib"
export CPPFLAGS="-I$OPENSSL_1_1/include"
export PKG_CONFIG_PATH="$OPENSSL_1_1/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$OPENSSL_1_1"

# For future reference, but should not be required
# export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
# export optflags="-Wno-error=implicit-function-declaration"
