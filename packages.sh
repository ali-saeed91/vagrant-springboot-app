#!/bin/sh

#Check the current user
		echo "whoami..."
		whoami

		#Check Current Working Directory
		echo "pwd..."
		pwd

		# UPDATE THE SYSTEM
		echo "upgrading..."
		sudo yum upgrade -y

		echo "installing gfortran..."
		sudo yum install gcc-gfortran -y

		echo "installing Unzip..."
		sudo yum install unzip -y

		echo "installing nano"
		sudo yum install -y nano

		echo "installing Wget"
		sudo yum install -y wget
		
		
	    echo "Git Setup..."
		yum -y install git
		git --version


		#sudo git config --global init.defaultBranch development # CHANGE GIT DEFAULT BRANCH NAME #
		sudo git config --global user.name $NAME                # $NAME FOR USAGE $EMAIL FOR USAGE
		sudo git config --global user.email $EMAIL              # $EMAIL FOR USAGE 
		#sudo git config --global core.excludesfile '~/.sudo gitignore' # A GLOBAL GIT IGNORE FILE:


		sudo git config --global credential.helper cache

		# YOU MIGHT NOT SEE COLORS WITHOUT THIS
		sudo git config --global color.ui true
		
		  echo "Installing java ... "
		  sudo yum -y install java-11-openjdk
		  java –version
		  javac -version
		  sudo yum -y remove java-1.8.0-openjdk.x86_64

		
		echo "Installing Mysql Server ... "
		sudo dnf update -y
		sudo dnf install mysql-server -y
		sudo systemctl start mysqld.service
		sudo systemctl status mysqld
		sudo systemctl enable mysqld

		echo "Chaange Mysql root password"
		/usr/bin/mysql -uroot -p petclinic -e 'SELECT CURDATE();' || /usr/bin/mysqladmin -u root password 'petclinic' || echo "Root Password is Already Set"

		mysql -uroot -pcomsc -e "CREATE DATABASE IF NOT EXISTS petclinic"
		mysql -uroot -pcomsc -e "CREATE USER 'petclinic'@'%' IDENTIFIED WITH authentication_plugin BY 'petclinic'";
		
		echo "Installing Gradel..."
		wget https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -P /tmp
		sudo unzip -d /opt/gradle /tmp/gradle-*.zip
		sudo rm /etc/profile.d/gradle.sh
		sudo touch /etc/profile.d/gradle.sh
		echo "export GRADLE_HOME=/opt/gradle/gradle-7.4.2" >> /etc/profile.d/gradle.sh
		echo "export PATH=${GRADLE_HOME}/bin:${PATH}" >> /etc/profile.d/gradle.sh
		sudo chmod +x /etc/profile.d/gradle.sh
		sudo source /etc/profile.d/gradle.sh
		gradle --version
		sudo yum -y remove java-1.8.0-openjdk.x86_64
		
		# echo "Installing maven..."
		# yes | sudo yum install maven
		# mvn -version
		sudo yum -y remove java-1.8.0-openjdk.x86_64
		echo "Project Setup..."
 
		git clone https://github.com/spring-projects/spring-petclinic.git

		mysql -uroot -pcomsc petclinic < /home/vagrant/spring-petclinic/src/main/resources/db/mysql/user.sql
		mysql -uroot -pcomsc petclinic < /home/vagrant/spring-petclinic/src/main/resources/db/mysql/schema.sql

		cd spring-petclinic
		./mvnw package
		nohup java -jar target/*.jar &
		
		#Network
		sudo service iptables stop
		sudo iptables -F
		sudo iptables -P INPUT ACCEPT
		sudo iptables -P FORWARD ACCEPT
		sudo iptables -P OUTPUT ACCEPT
		sudo iptables -L -v
	
