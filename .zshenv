venv () {
  if [ -d venv ]; then
    source venv/bin/activate
  else
    python3.9 -m venv venv
    source venv/bin/activate
    pip install -U pip setuptools wheel >/dev/null
  fi
}

export PATH=$PATH:/usr/local/go/bin:$HOME/.local/bin:$HOME/.emacs.d/bin
source $HOME/.cargo/env
