# ubuntuSNMPimage
- Contains files and support for tracking down reconnection issues with SNMPv3

### To create an Ubuntu Docker image which builds/installs the latest net-snmp support found at 
(https://github.com/net-snmp/net-snmp/tree/master), the following files are required:

- Dockerfile		: Standard format Dockerfile with rules for image creation
- config.status		: Configuration for building of net-snmp without user intervention
- buildImage.sh		: Script to build the image


### Also has files for localized testing of communication/reconnection issues:
- localget.c		: Simple C code based heavily on snmpget.c with looping and timestamps/counters
