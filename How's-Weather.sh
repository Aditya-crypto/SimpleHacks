t_arg=$#
if (( t_arg<2 ));then
   echo "please enter two arguments"
else
n1=$1
n2=$2
str='https://darksky.net/forecast/'
res="$str$n1,$n2/uk212/en/"
#echo "$res"
wget $res
clear
echo -n "The temperature is "

temp=$(cat index.html | grep '\<currently =' | grep -o '\<temperature.......' | grep -o '[0-9]...')
echo "$temp degree celcius"
temp1=$(cat index.html | grep '\<currently =' | grep -o 'icon........' | grep -o ':.*' | grep -o '[a-z].*')
echo "weather is $temp1"
rm index.html
fi
