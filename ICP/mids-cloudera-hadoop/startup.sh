#! /usr/bin/env bash

echo "###################### Starting Jupyter Notebook ######################"
source /opt/anaconda/bin/activate

echo "generating config at: /home/$USER/.jupyter/jupyter_notebook_config.py"
jupyter notebook --generate-config

test -f /home/$USER/.jupyter/jupyter_notebook_config.py
echo "Config folder created: $?"

jupyter notebook --port 8889 --notebook-dir='/media/notebooks' --ip='*' --no-browser &
