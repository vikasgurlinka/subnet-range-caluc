#!/usr/bin/perl

use 5.010;
sub range{
$ip=$_[0];

#say "------------------------------";
#say " ";
#say "Given ip 	: $ip";
# split passed arguments in to ip address and subnet mask value

($ip,$sub_mask)=split('/',$ip);

@ip=split(/\./,$ip);

    if($sub_mask > 30)
	{
	  $sub_mask=30;
	}
    if($sub_mask==0)
	{
	$sub_mask=1;
	}
#  caluclate number of possible hosts
 $num_of_hosts=2**(32-$sub_mask);
 #say "possible hosts  : $num_of_hosts";

# caluclate subnet mask ip
$x=$sub_mask%8;
#$y=8-$x;
#$val=2**$y;
$val=$x;


%match = (
    "0"   => "255",
    "7"   => "254",
    "6"   => "252",
    "5"   => "248",
    "4"  => "240",
    "3"  => "224",
    "2"  => "192",
    "1" => "128"
);


@subnet_ip=(255,255,255,255);
@net_ip=@ip;


	if($sub_mask > 24 && $sub_mask < 32)
		{

		# define subnet mask ip address
		$subnet_ip[3]=$match{$val};
		$sub_mask_ip=join('.',@subnet_ip);
		#say "Subnet mask ip  : $sub_mask_ip";

		# define network ip address

		$net_ip[3]=int($ip[3])& int($match{$val});	
		$network_ip=join('.',@net_ip);
		#say "Network ip      : $network_ip";
		
		# caluclate start value end value of address range
		$start_val=int($net_ip[3])+1;
                $end_val=int($net_ip[3])+($num_of_hosts -2);
                $broadcast_val=$end_val+1;
	
		# caluclate IP address range and Broadcast address
		$net_ip[3]=$start_val;
		$start_ip=join('.',@net_ip);

		$net_ip[3]=$end_val;
		$end_ip=join('.',@net_ip);
		$net_ip[3]=$broadcast_val;

		$broadcast_ip=join('.',@net_ip);

		}

	if($sub_mask > 16 && $sub_mask < 25)
		{

		#define subnet mask ip address
		$subnet_ip[2]=$match{$val};
		$subnet_ip[3]=0;
		$sub_mask_ip=join('.',@subnet_ip);
		#say "Subnet mask ip  : $sub_mask_ip";

        # define network ip address

		$net_ip[2]=int($ip[2])& int($match{$val});
		$net_ip[3]=0;
		$network_ip=join('.',@net_ip);
		#say "Network ip      : $network_ip";

		# caluclate start value end value of address range
		$start_val=int($net_ip[3])+1;
		$n=$num_of_hosts/256;
		
		$end_val_oct_3=int($net_ip[2])+($n-1);
		$end_val_oct_4=254;
		$broadcast_val=255;
		
	    # caluclate IP address range and Broadcast address
	    $net_ip[3]=$start_val;
	    $start_ip=join('.',@net_ip);
	
	    $net_ip[3]=$end_val_oct_4;
		$net_ip[2]=$end_val_oct_3;
	    $end_ip=join('.',@net_ip);
	    $net_ip[3]=$broadcast_val;
	
	    $broadcast_ip=join('.',@net_ip);

		}

	if($sub_mask > 8  && $sub_mask < 17)
		{
	
				#define subnet mask ip address
                $subnet_ip[1]=$match{$val};
                $subnet_ip[2]=0;
				$subnet_ip[3]=0;
                $sub_mask_ip=join('.',@subnet_ip);
                #say "Subnet mask ip  : $sub_mask_ip";

                # define network ip address

                $net_ip[1]=int($ip[1])& int($match{$val});
                $net_ip[2]=0;
				$net_ip[3]=0;
                $network_ip=join('.',@net_ip);
                #say "Network ip      : $network_ip";

				# caluclate start value end value of address range
				$start_val=int($net_ip[3])+1;
				$n=($num_of_hosts/256)/256;
		
				$end_val_oct_2=int($net_ip[1])+($n-1);
				$end_val_oct_3=255;
				$end_val_oct_4=254;
				$broadcast_val=255;

				# caluclate IP address range and Broadcast address
	    		$net_ip[3]=$start_val;
	    		$start_ip=join('.',@net_ip);
	
	    		$net_ip[3]=$end_val_oct_4;
				$net_ip[2]=$end_val_oct_3;
				$net_ip[1]=$end_val_oct_2;
	    		$end_ip=join('.',@net_ip);
	    		$net_ip[3]=$broadcast_val;
	
	    		$broadcast_ip=join('.',@net_ip);

		}

	if($sub_mask > 0  && $sub_mask < 9 )
		{
			
				#define subnet mask ip address
                $subnet_ip[0]=$match{$val};
				$subnet_ip[1]=0;
                $subnet_ip[2]=0;
				$subnet_ip[3]=0;
                $sub_mask_ip=join('.',@subnet_ip);
                #say "Subnet mask ip  : $sub_mask_ip";

                # define network ip address

                $net_ip[0]=int($ip[0])& int($match{$val});
                $net_ip[2]=0;
				$net_ip[3]=0;
				$net_ip[1]=0;
                $network_ip=join('.',@net_ip);
                #say "Network ip      : $network_ip";

				# caluclate start value end value of address range
				$start_val=int($net_ip[3])+1;
				$n=(($num_of_hosts/256)/256)/256;
		
				$end_val_oct_1=int($net_ip[0])+($n-1);
				$end_val_oct_2=255;
				$end_val_oct_3=255;
				$end_val_oct_4=254;
				$broadcast_val=255;

				# caluclate IP address range and Broadcast address
	    		$net_ip[3]=$start_val;
	    		$start_ip=join('.',@net_ip);
	
	    		$net_ip[3]=$end_val_oct_4;
				$net_ip[2]=$end_val_oct_3;
				$net_ip[1]=$end_val_oct_2;
				$nnet_ip[0]=$end_val_oct_1;
	    		$end_ip=join('.',@net_ip);
	    		$net_ip[3]=$broadcast_val;
	
	    		$broadcast_ip=join('.',@net_ip);


		}



#say " ";
#say "-------HOST ADDRESS RANGE---------";
#say " ";
#say "Start ip	       : $start_ip";
#say "End ip  	       : $end_ip";
#say "Broadcast address      : $broadcast_ip";
#say " ";
@range=($start_ip,$end_ip);
@range;
}
1;