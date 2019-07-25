 #!/bin/bash
os_version=`hostnamectl | sed -n 's/.*Ubuntu //p'`
#echo "$os_version"
kernel_version=`hostnamectl | sed -n 's/.*Linux //p'`
echo "Current OS Version: $os_version, Current Kernel version: $kernel_version"
if  [ "$kernel_version" != "4.4.0-154-generic" ] || [ "$os_version" != "16.04.6 LTS" ]; then
     echo "$(date): $(hostname) Os or kernel version not matching"
 #    exit 1
fi
