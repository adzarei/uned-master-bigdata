#! /usr/bin/env bash

echo "###################### Starting Jupyter Notebook ######################"
source /opt/anaconda/bin/activate
jupyter notebook --port 8889 --notebook-dir='/media/notebook' --no-browser  --allow-root  &
echo "###################### Started Jupyter Notebook ######################"

