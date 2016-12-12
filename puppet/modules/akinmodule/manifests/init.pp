class akinmodule {

	file { "/usr/share/xfce4/backdrops/taustakuva.png":
		source => "/etc/puppet/modules/akinmodule/files/taustakuva.png",
	}
	
	file { "/home/xubuntu/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml":
		content => template("akinmodule/xfce4-desktop.xml"),
	}

	package { "google-chrome-stable_current_amd64.deb":
		
		provider => dpkg,
		source => "/etc/puppet/modules/akinmodule/files/google-chrome-stable_current_amd64.deb",
		require => Package ["libappindicator1"],
		
	}
	
	Package {ensure => "installed", allowcdrom => "true"}

	package {libappindicator1:}
	package {google-chrome-stable:}

}
