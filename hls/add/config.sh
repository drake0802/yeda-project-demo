#!/bin/sh

name=$(echo ${PWD##*/})
problem='problem'
answer='answer'
template='template'
set dirs ${name}-${problem} ${name}-${answer} ${name}-${template}
shift 1
for dir do 
    mkdir ${dir}
    for f in `cat ./${problem}.conf`; do
        file=$(echo ${f} | sed -e 's/\r//g')
        if [ -e ${file} ]
        then  
            if [ ! ${file} = 'build.sh' ] && [ ! ${file} = 'check.sh' ] && [ ! ${file} = 'check.py' ] && [ ! ${file} = 'config.sh' ]
            then
                cp ${file} ${dir}
            elif [ ! ${dir} = ${name}-${template} ]
            then
                cp ${file} ${dir}
            fi
        fi
    done
    if [ ${dir} = ${name}-${answer} ]
    then
        for f in `cat ./${answer}.conf`; do 
            file=$(echo ${f} | sed -e 's/\r//g')
            if [ -e ${file} ]
            then
                cp ${file} ${dir}
            fi
        done
    fi
    if [ ${dir} = ${name}-${template} ]
    then
        find . -name "*.template" | xargs -i cp {} ${dir}
        find ${dir}  -name "*.template" | sed -e "p;s/.template//" | xargs -n2 mv
    fi
    cd ${dir} && zip -q -r ../$dir.zip *
    cd .. && rm $dir -rf
done