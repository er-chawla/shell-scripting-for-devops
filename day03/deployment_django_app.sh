#!/bin/bash


<<task 
Deploy a Django app
and handle the code for errors

task

code_clone(){

  echo "********** Step1: Cloning the Django app ************"
  git clone https://github.com/er-chawla/django-notes-app.git

}

install_requirement(){

  echo "*********** Step2: Installing dependencies*************"
  sudo apt-get install docker.io nginx docker-compose -y
}

required_restart() {
  echo "*********** Step3: Required system restart *************"
  sudo chown $USER /var/run/docker.sock
  #sudo systemctl enable docker
  #sudo systemctl enable nginx
  #sudo  systemctl restart docker
}

deploy() {
  echo "************* Step4: Docker Build start/Run *************"
  docker build -t notes-app .
  #docker run -d -p 8000:8000 notes-app:latest
  docker-compose up -d
}


echo "************* Deployment Start *************"

if ! code_clone; then
	echo "the code directory is already exists"
	cd django-notes-app
fi

if ! install_requirement; then

	echo "Installation failed"
	exit 1
fi

if ! required_restart; then
	echo "System fault identified"
	exit 1
fi
if ! deploy; then 
        echo "Deployment failed, mailed the admin"
	exit 1
fi

echo "************* Deployment Done **************"

