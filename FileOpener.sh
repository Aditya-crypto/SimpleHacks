t_arg=$#
if (( t_arg<1 ));then
   echo enter file name
else
str=$1
temp=$(echo "$str" | grep -o '\..*')
case $temp in
.txt | .py | .c++ | .c | .java)
gedit "$str"
exit 0
;;
.pdf)
ebince "$str"
;;
.mp4 | .mp3 | .wav | .flv)
vlc "$str"
;;
.jpg | .png | .bmp | jpeg)
display "$str"
;;
.html)
open "$str"

;;
*)
echo "file cannot be open"
;;

esac
fi
