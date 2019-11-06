#! /usr/bin/env bash

echo "###################### Starting Jupyter Notebook ######################"
source /opt/anaconda/bin/activate

#echo "generating config at: ~/.jupyter/jupyter_notebook_config.py"
#jupyter notebook --generate-config

test -f ~/.jupyter/jupyter_notebook_config.py
echo "Config folder created: $?"

echo adding password \'uned\' to jupyter.
sed -i 's/c.NotebookApp.password = ''/c.NotebookApp.password = 'uned'/g' ~/.jupyter/jupyter_notebook_config.py

jupyter notebook --port 8889 --notebook-dir='/media/notebooks' --ip='*' --no-browser &
