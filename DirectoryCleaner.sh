t_arg=$#
if (( t_arg<1 ));then
   echo "please enter directory path to be organized"
else
  str=$1
  cd
  cd $str
  ls > zzz.txt
  file='zzz.txt' 
  while read line ; do
    temp=$(echo "$line" | grep -o '\..*')
    #echo "$temp"
    case $temp in
    .txt)
     name='txt'
     if [ -d "$name" ];then
         mv "$line" txt
     else
     mkdir txt
     mv "$line" txt
     fi
     ;;
    .pdf)
       name='pdf'
       if [ -d "$name" ];then
       mv "$line" pdf
       else
       mkdir pdf
       mv "$line" pdf
       fi
       ;;
      .pptx)
        name='pptx'
       if [ -d "$name" ];then
         mv "$line" pptx
         else
         mkdir pptx
          mv "$line" pptx
       fi
       ;;
.zip | .tar | .tar.gz)
name='compressed'
if [ -d "$name" ];then
   mv "$line" compressed
else
mkdir compressed
mv "$line" compressed
fi
;;
.jpg | .jpeg | .png | .gif)
name='images'
if [ -d "$name" ];then
   mv "$line" images
else
mkdir images
mv "$line" images
fi
;;
.mp4)
name='mp4'
if [ -d "$name" ];then
   mv "$line" mp4
else
mkdir mp4
mv "$line" mp4
fi
;;
.mp3)
name='mp3'
if [ -d "$name" ];then
   mv "$line" mp3
else
mkdir mp3
mv "$line" mp3
fi
;;
.html)
name='html'
if [ -d "$name" ];then
   mv "$line" html
else
mkdir html
mv "$line" html
fi
;;

*)
name='extras'
if ! [ -d "$name" ];then
mkdir extras
fi
if ! [ -d "$line" ] ; then
mv "$line" extras
fi
;;

esac
done < $file
cd txt
rm zzz.txt
fi
