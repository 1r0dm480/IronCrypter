#!/bin/bash
function helps {
echo "File decrypter  -  help"
echo "This only works for IronHackers - Crypter"
            echo "-f file to decrypt"
	    echo "-p file with pass.enc"
	    echo "-k PEM key file"
	    echo "Decrypter need a file to work"
	    echo " "
	    echo "Example of usage: ./ironHackers-Decrypter.sh -f file.txt.WNCRY -p key.enc -k key.pem"
            exit 1       


}
function decrypt {
original=$(echo "$1" | cut -d "." -f 1)
openssl rsautl -decrypt -inkey $3 -in $2 -out key.txt
openssl enc -aes-256-cbc -d -pass file:key.txt -in "$1" -out "$original.decrypted"
rm key.txt
rm $1
echo "File $1 decrypted! Decrypte file is $original.decrypted"
}
echo ""
echo "

██╗██████╗  ██████╗ ███╗   ██╗██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ ███████╗
██║██╔══██╗██╔═══██╗████╗  ██║██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗██╔════╝
██║██████╔╝██║   ██║██╔██╗ ██║███████║███████║██║     █████╔╝ █████╗  ██████╔╝███████╗
██║██╔══██╗██║   ██║██║╚██╗██║██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗╚════██║
██║██║  ██║╚██████╔╝██║ ╚████║██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║███████║
╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
                                                                                      
By Ghostpp7 @ IronHackers.es
"
echo ""
echo ""
if [ $# == 6 ]; then
cont=0
for num in $@; do
array[$cont]=$num
cont=$(expr $cont + 1)

done
for((i=0;i<$#;i++)); do
if [ "${array[$i]}" == "-f" ]; then
i=$(expr $i + 1)
file=${array[$i]}
elif [ "${array[$i]}" == "-p" ]; then
i=$(expr $i + 1)
pass=${array[$i]}
elif [ "${array[$i]}" == "-k" ]; then
i=$(expr $i + 1)
key=${array[$i]}
elif [ $i == 1 ] || [ $i == 3 ] || [ $i == 5 ]; then
helps
exit
fi
done
decrypt $file $pass $key
else
helps
fi
