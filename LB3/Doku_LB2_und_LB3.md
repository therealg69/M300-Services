
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


# LB 3

### K1
Umbebung auf eigenem Notebook eingerichtet und funktionsfähig
- VirtualBox

- Vagrant

- Visualstudio-Code

- Git-Client

- SSH-Key für Client erstellt 

[Dies wurde alles schon in der LB2 erledigt]

**GitHub**  GitHub brauchen wir für die Versionsverwaltung. Bei GitHub kann man Dokumente zentral hochladen und runterladen.

**Vagrant**  Vagrant ist die Software, mit welcher wir unsere Virtuellen Maschinen automatisiert aufsetzen können.

**Virtual Box**  Virtualbox ist eine Virtualisierungssoftware welches von Oracle nun entwickelt wird. Die in den nächsten Schritten erstellten virtuellen Maschinen werden auf Virtualbox laufen und geöffnet.

**Visualstudio**  Visualstudio-Code ist ein Text-Editor, welcher von Microsoft entwickelt wurde. In diesem Modul wird die Dokumentation mit Hilfe von Visualstudio-Code dokumentiert.

### K2 

Eigene Lernumgebung ist eingerichtet

- GitHub oder Gitlab-Account ist erstellt

- Git-Client wurde verwendet

- Dokumentation ist als Mark Down vorhanden

- Markdown-Editor ausgewählt und eingerichtet

- Markdown ist strukturiert

- Persönlicher Wissenstand im Bezug auf die wichtigsten Themen ist dokumentiert (Containerisierung / Docker, Microservices)

##### Containerisierung / Container
**Container** sind eine Virtualisierungstechnik im Computerumfeld, die Anwendungen inklusive ihrer Laufzeitumgebungen voneinander trennt. Im Gegensatz zu einer virtuellen Maschine beinhalten Container kein eigenes Betriebssystem, sondern verwenden das des Systems, auf dem sie installiert sind.

**Containerisierung** wird von vielen als „Virtualisierung der Virtualisierung“ oder „Virtualisierung der nächsten Generation“ gesehen. Dabei gab es die Containerisierung bereits lange vor der Virtualisierung oder dem Aufkommen von modernen Technologien wie Docker und Linux Containers.


### K3

 #### Docker Befehle
 
 | Befehl                               | Bedeutung                           |
|--------------------------------------|-------------------------------------|
| docker build "Source"                | Erstellt ein Docker image           |
| docker exec it "Container" \bin\bash | Exploriert einen Container          |
| docker images                        | Zeigt alle verfügbare Docker images |
| docker rmi "image"                   | Löscht ein Docker image             |
| docker run "image"                   | startet ein Docker image            |

#### Docker installation
TAAPEAA1@U278700 MINGW64 /c/users/TAAPEAA1/Desktop/M300-Services (master)
$ vagrant ssh
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-148-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

52 packages can be updated.
29 updates are security updates.

New release '18.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Mon Jun 17 13:03:57 2019 from 10.0.2.2
vagrant@web:~$ docker --version
Docker version 18.09.5, build e8ff056
vagrant@web:~$

*Ist Docker überhaupt installiert?*

```
docker --version

```

*Wurde das Docker-Volumen erstellt?*

```
docker container list

```

*Kann ich auf meine Dienste zugreifen?*

Im Browser localhost öffnen mit z.B. Port 8080

```
localhost:8080

```

*Sind die FireWall Ports offen?*
`
sudo ufw status`


#### Docker installation

Als erstes muss man das Image erstellen.

```
docker build -t webserver .

```

Kontrollieren, ob das Image erstellt worden ist kann man so

```
docker images

```

Danach kann man den Container erstellen. Dafür muss man das Image angeben.

```
docker run --rm -d --name webserver webserver

```

Mit folgendem Befehl kann man kontrollieren, ob der Container läuft.

```
docker ps

```

Der Webserver war unter der URL:[http://localhost:8080](http://localhost:8080/)  erreichbar.

Volumen einrichten  So erstellt man ein Volumen.

```
docker volume create "Name"

```

Um zu kontrollieren, ob das Volume richtig erstellt wurde, kann man folgenden Befehl eingeben und alle Volumen werden angezeigt.

```
docker volume ls
```

#### Sicherheitseinstellungen Docker

Für alle Applikationen kann ein andere Host Port weitergeleitet werden. Diese definiert man mit der Zeile EXPOSE. Anderweitige Einstellungen können vorgenommen werden, indem man einem User die Berechtigung gibt einen gewissen Container anzupassen. Sonst noch kann man Gruppeneinstellungen vornehmen, damit nur eine gewisse Benutzergruppe einen Container verwalten kann.


**Service Überwachung**

Docker Container kann man mit verschiedenen Befehlen überwachen. Zum einen kann man alle Docker Prozesse mittels docker ps anzeigen und falls man alle Container auflisten will, dann gibt es den Befehl Docker Container list. Mit Docker logs zeigt man aktive statistiken eines Containers auf. Zusätzlich zeigt er die stderr und stdout statistiken raus.

_stderr_

Stderr, auch bekannt als Standardfehler, ist der Standard-Dateideskriptor, mit dem ein Prozess Fehlermeldungen schreiben kann.

In Unix-ähnlichen Betriebssystemen wie Linux durch den POSIX-Standard definiert..

Im Terminal wird der Standardfehler standardmässig auf dem Bildschirm des Benutzers angezeigt.

_stdout_

Stdout, auch bekannt als Standardausgabe, ist der Standard-Dateideskriptor, mit dem ein Prozess die Ausgabe schreiben kann.

Im Terminal wird die Standardausgabe standardmässig auf dem Bildschirm des Benutzers angezeigt.


#### K5

**Vergleich Vorwissen - Wissenszuwachs**   Ich denke ich habe die einfachen Grundlagen von Containern verstanden. Ich habe schon mal von Docker gehört aber es nie benutzt. In diesem Modul habe ich viel neues gelernt

**Reflexion**  Ich konnte viel über das Thema Container lernen. Das nächste mal sollte ich die Zeit ein bisschen einteilen, damit ich genug Zeit habe meine Doku/LB fertigzustellen.

#### K6
**Image Bereitstellung**  Beispiel von mc-b/m300

```
FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -q -y install apache2 

# Konfiguration Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN mkdir -p /var/lock/apache2 /var/run/apache2

EXPOSE 80

VOLUME /var/www/html

CMD /bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"
```
