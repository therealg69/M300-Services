﻿
dokumentation
Aathi
-------------

# Vagrant
vagrant init	Initialisiert im aktuellen Verzeichnis eine Vagrant-Umgebung und erstellt, falls nicht vorhanden, ein Vagrantfile
vagrant up	Erzeugt und Konfiguriert eine neue Virtuelle Maschine, basierend auf dem Vagrantfile
vagrant ssh	Baut eine SSH-Verbindung zur gew�nschten VM auf
vagrant status	Zeigt den aktuellen Status der VM an
vagrant port	Zeigt die Weitergeleiteten Ports der VM an
vagrant halt	Stoppt die laufende Virtuelle Maschine
vagrant destroy	Stoppt die Virtuelle Maschine und zerstoert sie.

dies ist ein test file von Aathi

# Firewall
Eine Firewall ist ein Sicherungssystem, welches ein Rechnernetz oder einen einzelnen Computer vor unerwünschten Netzwerkzugriffen schützt und weiter gefasst auch ein Teilaspekt eines Sicherheitskonzepts ist.

Jedes Firewall-Sicherungssystem basiert auf einer Softwarekomponente. Die Firewall-Software dient dazu, den Netzwerkzugriff zu beschränken, basierend auf Absender- oder Zieladresse und genutzten Diensten. Sie überwacht den durch die Firewall laufenden Datenverkehr und entscheidet anhand festgelegter Regeln, ob bestimmte Netzwerkpakete durchgelassen werden oder nicht. Auf diese Weise versucht sie, unerlaubte Netzwerkzugriffe zu unterbinden.

#UFW Firewall
UFW steht für Uncomplicated Firewall. Ziel von UFW ist es, ein unkompliziertes Kommandozeilen-basiertes Frontend für das sehr leistungsfähige, aber nicht gerade einfach zu konfigurierende iptables zu bieten. UFW unterstützt sowohl IPv4 als auch IPv6.

# Benutzer & Rechteverwaltung

Linux kennt als Multiuser-Betriebssystem - wie alle unixoiden Betriebssysteme - das Konzept verschiedener Benutzer. Diese haben nicht alle unbedingt dieselben Rechte und Privilegien.

Neben den eigentlichen Benutzerkonten für reale Personen existieren auf dem System noch viele Systemdienste mit einem eigenen Benutzerkonto. Dadurch wird erreicht, dass eine mögliche Schwachstelle in einem Dienst nicht zu grosse Auswirkungen auf das System haben kann.

# LB 2 Webserver
http://10.0.0.3/:80
Ich habe einen apache webserver aufgesetzt

Code:
Vagrant.configure("2") do |config|
	config.vm.define "web" do |web|
		
		web.vm.box = "ubuntu/xenial64"
		
		web.vm.hostname = "web"
		
		web.vm.network "private_network", ip: "10.0.0.3"
		
		web.vm.provider "virtualbox" do |vb|
			
			vb.memory = "512"
			
			vb.name = "web"
		
		end
		
		web.vm.synced_folder ".", "/vagrant"
		
		web.vm.provision "shell", path: "web.sh"
	end			

end

# Firewall einrichten inkl. rules
-web.sh

sudo apt-get -y install apache2

sudo ufw --force enable

sudo ufw allow 80/tcp

sudo ufw allow ssh

echo "ServerName localhost" >> /etc/apache2/apache2.conf

sudo service apache2 restart

# Benutzer und Rechtevergabe
vagrant@web:~$ sudo groupadd admin
groupadd: group 'admin' already exists
vagrant@web:~$ sudo useradd user01 -g admin -m -s /bin/bash
vagrant@web:~$ sudo useradd user02 -g admin -m -s /bin/bash
vagrant@web:~$ sudo chpasswd <<<user01:0007
vagrant@web:~$ sudo chpasswd <<<user02:0008
vagrant@web:~$ exit


