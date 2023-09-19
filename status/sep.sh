#!/usr/bin/env bash

#      

# 
sep_up(){
    echo "#[fg=$2,bg=$1]"
}
# 
sep_down(){
    echo "#[fg=$1,bg=$2]"
}
sep_up_doble(){
    echo "#[fg=$c_bg,bg=$1]#[fg=$2,bg=$c_bg]"
}
# 
sep_left(){
    echo "#[fg=$1,bg=$2]"
}
# 
sep_right(){
    echo "#[fg=$1,bg=$2]"
}
