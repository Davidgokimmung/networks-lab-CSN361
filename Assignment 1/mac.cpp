#include <iostream>
#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <net/if.h>
#include <unistd.h>

using namespace std;

void getMacAddress(char * uc_Mac)
{
   	 int f;
	
	struct ifreq ifr;
	char *iface =(char*) "eth0";
	char *mac;
	
	f = socket(AF_INET, SOCK_DGRAM, 0);

	ifr.ifr_addr.sa_family = AF_INET;
	strncpy((char *)ifr.ifr_name , (const char *)iface , IFNAMSIZ-1);

	ioctl(f, SIOCGIFHWADDR, &ifr);

	close(f);
	
	mac = (char *)ifr.ifr_hwaddr.sa_data;
	
	sprintf((char *)uc_Mac,(const char *)"%.2x:%.2x:%.2x:%.2x:%.2x:%.2x\n" , mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
	
}

int main()
{
	char macaddr[32]={0};

	getMacAddress (macaddr);

	cout<<endl<<"Mac Address : "<<macaddr;
	return 0;
}

