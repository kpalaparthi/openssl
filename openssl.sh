#!/bin/bash
for i in `cat test`
do
t1=`openssl s_client -connect $i:443 -tls1| openssl x509 -noout -dates&"
t1_1=`openssl s_client -connect $i:443 -tls1_1| openssl x509 -noout -dates&"
t1_2=`openssl s_client -connect $i:443 -tls1_2| openssl x509 -noout -dates&"

if [ -z $t1 ]
then 
echo "Tlsv1 is disabled for $i" >>tls1
else
echo "Tlsv1 is enabled for $i" >>tls1
fi

if [ -z $t1_1 ]
then 
echo "Tlsv1_1 is disabled for $i" >>tls1_1
else
echo "Tlsv1_1 is enabled for $i" >>tls1_1
fi

if [ -z $t1_2 ]
then 
echo "Tlsv1_2 is disabled for $i" >>tls1_2
else
echo "Tlsv1_2 is enabled for $i" >>tls1_2
fi
done
