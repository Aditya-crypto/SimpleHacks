t_arg=$#
if (( t_arg<1 ));then
   echo "please enter file name"
else
fname=$1
str=$(echo "$fname" | grep -o '\..*')
case $str in
.tar)
tar -xvf "$fname"
;;
.tar.gz)
tar -xzvf "$fname"
;;
.tar.bz2)
tar -xfj "$fname"
;;
.bz2)
tar -xf "$fname"
;;
.zip)
unzip "$fname"
;;
*)
echo please enter a valid extension
esac
fi
