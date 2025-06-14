#!/bin/sh
# This script update the Code Server environment with Python, PyEnv and related tools.

sudo apt update 
sudo apt install build-essential pipx make -y
sudo zlib1g zlib1g-dev libbz2-dev libssl-dev libffi-dev liblzma-dev libsqlite3-dev libreadline-dev -y

# Install PyEnv
curl -fsSL https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.load-pyenv-to-path
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.load-pyenv-to-path
echo 'eval "$(pyenv init -)"' >> ~/.load-pyenv-to-path

echo -e "\n# python" | tee -a  ~/.zshrc ~/.bashrc
echo 'if [[ "$WHICH_PYTHON" == "" ]]; then export WHICH_PYTHON="pyenv"; fi;' | tee -a ~/.zshrc ~/.bashrc
echo 'if [[ "$WHICH_PYTHON" == "pyenv" ]]; then . ~/.load-pyenv-to-path; fi;' | tee -a ~/.zshrc ~/.bashrc

exec $SHELL

# Install Python 3.13 using PyEnv
pyenv install 3.13
pyenv shell 3.13
exec $SHELL

# Install and configure Poetry
pipx install poetry --python $(pyenv which python)
pipx inject poetry poetry-plugin-export
poetry config virtualenvs.in-project true