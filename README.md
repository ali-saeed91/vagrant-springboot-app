# vagrant-springboot-app
# vagrant-springboot-app A Vagrant setup for Springboot Application "petclinic" using java, gradle, mysql server,shell scripting built on CentOS and its dependencies. Vagrant is a "Infrastructure as a code" machine which contains all the dependencies and commands to setup and run the Software Application. In this app we are setting up a Vagrant machine to clone install and run the springboot application called "petclinic" which is built using java 11. In the setup we are doing the following steps using shell/bash scripting:  &lt;b>IMPORTANT: PLEASE CREATE AN EMPTY FOLDER NAMED "shared" NEXT TO  Vagrantfile AS ITS REQUIRED TO RUN &lt;/b>    1) Setting up the VM config using Oracle Virtual box   2) Installing upgrades for CentOS and packages for git, gcc-gfortran, unzip, nano, wget.   3) Configuring git for global development   4) Installing Java 11 openjdk and jre   5) Installing Mysql server   6) Installing Gradle for installing the springboot application which contains features of maven and ant required for Java application packages.   7) Cloning the application from https://github.com/spring-projects/spring-petclinic.git   8) Installing the application along with running JUnit tests and Checkstyle testing   9) Running the application in the background and forwarded on localhost:8080  &lt;b>TO TEST IF THE BUILD IS SUCCESSFUL AND APP IS RUNNING DO FOLLOWING:&lt;/b>  &lt;code>vagrant ssh&lt;/code>  &lt;code>curl localhost:8080/&lt;/code>  &lt;code>curl localhost:8080/vets&lt;/code>