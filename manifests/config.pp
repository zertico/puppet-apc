define apc::config (
	$enabled = false,
	$default_data = true,	
	$apc_shm_size = "256M" ,
	$apc_max_file_size = "20M",
	$apc_stat = "0",
	$apc_ttl = "7200",
	$apc_user_ttl = "7200",
){


	if $enabled == true {
		if $default_data == true {
			file { "/etc/php5/fpm/conf.d/20-apc.ini":
                                ensure => present,	
				content => "extension=apc.so",
                        }  
		} else {
			file { "/etc/php5/fpm/conf.d/20-apc.ini":
				ensure => present,
				content => template("apc/20-apc.ini.erb"),
			}
		}
	}  else {
		file { "/etc/php5/fpm/conf.d/20-apc.ini":
                       ensure => absent,
                }
	}
}
