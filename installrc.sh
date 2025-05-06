#!/usr/bin/env bash

# do not exit => link from here
# link and to here = updated
# dir => dir
# exists => file type
for fff in .bashrc.d .tmux.conf .vimrc
do
    if [[ ! -e ~/"${fff}" ]]
    then
        ln -vs $(readlink -f ${fff}) ~/"${fff}"
    elif [[ -L ~/"${fff}" ]]
    then
        echo -n ${fff} is link "- "
        if [ "$(readlink -f ~/${fff})" == "$(readlink -f ${fff})" ]
        then
            echo link is updated
        fi
    elif [[ -d ~/"${fff}" ]]
    then
        echo "${fff} is a dir"
    elif [[ -e ~/"${fff}" ]]
    then
        echo "${fff} file exists"
        file -sL ${fff}
    fi
done