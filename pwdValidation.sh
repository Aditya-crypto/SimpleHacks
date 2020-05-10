function check() {
var=$1
cp /usr/share/dict/american-english  word.txt
file='word.txt'
flag=0
while read line ; do
size=${#line}
if(( size>=4 ));then
   if [[ $var == *"$line"* ]];then
       echo "weak"
       flag=1;
   fi
fi
done < $file
rm word.txt

}

#t_arg=$#
#if (( t_arg<1));then
#  echo "enter passwd"
#else
stty -echo
read pass
stty echo
  len=${#pass}
    if(( len<8));then
       echo "weak"
    else
       echo $pass > pass.txt
       if grep -oq '[0-9]' pass.txt 
       then
          if grep -oq '[@#$%&*+-=]' pass.txt
          then
             check $pass
             if ((flag==0 ));then
                 echo strong
             fi
          else
            echo weak
          fi
       else
          echo "weak"
       fi
    fi
 rm pass.txt
#fi
