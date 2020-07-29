# Creating a Multi Vagrant Machine with Linux :computer: :computer:

## Aims of this activity :books:

### 1) [Create a second virtual machine within our vagrant file with the name "db"](#Task-1)

### 2) [Configure the db machine with a different IP address from the current app virtual machine](#Task-2)

### 3) [Provision the db with a MongoDB database](#Task-3)

### 4) [Task Review](#Task-Review)


## Task 1

- Once inside the folder named "multi-machine-start-code", navigate into the folder containing the
Vagrant file

- To create a second VM, we must enter this vagrant file with the command ``` nano Vagrantfile``` in which the first 
VM has already been created.

- Once here, we can add the configurations necessary to create the VM

![vagrant file](images/new_vm_snippet.png)

## Task 2

- Where we configure the VM network, we have changed the ip address
for our database Virtual Machine, this means they can be hosted on separate ports

![vagrant file](images/ip_address_snippet.png)

- Before running anything on our VMs, we want to relocate to the folder where our provisions.sh
file is located, using the path

```
.../Multi-Vagrant-Machine/environment/app
```

- Once here we will run ``` chmod +x provision.sh ```, this command will make the file executable and so
it will run when we turn on our Virtual Machines.

- Now that our provisions file is executable , we want to check that the existing code that we have is working correctly.
- From the same directory as the vagrant file we run vagrant up, due to our changes if all goes to plan
after the VM named "app" is created, "db" should also be created afterwards

- Now that both Virtual Machines are running, we must specifiy which VM we want to enter when using vagrant ssh
```bash
vagrant ssh db
vagrant ssh app
```

- We can then change directory into our tests folder and run the command ``` rake spec ```. By doing this we will know whether
our VMs are working as they should.

![vagrant file](images/vm_test_pass_1.png)


## Task 3

- To be able to connect our VM to the MongoDB server using bash scripts we must update the contents within our 
provision.sh file.

- To do this must first make a new directory inside the environments directory and name it ```/db```

- Now in this file we create a new provision.sh file with the following contents

```bash
#!/bin/bash

# be careful of these keys, they will go out of date
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list



sudo apt-get update -y
sudo apt-get upgrade -y



# sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20



# remove the default .conf and replace with our own configuration
# thus before adding our own, we must remove the old configuration
sudo rm /etc/mongod.conf
sudo ln -s /home/vagrant/environment/mongod.conf /etc/mongod.conf



# if mongo is is set up correctly these will be successful
sudo systemctl restart mongod
sudo systemctl enable mongod
```

- We will now be able to run the tests with zero failures on both Virtual Machines

![vagrant file](images/all_test_passes.png)






## Task Review :white_check_mark:

- One of the main principles of DevOps is automation and efficient development. This task has shown how they have been implemented.

- This task has shown the importance of using bash scripts. Writing all the commands in one provisions file that is executed
once the vagrant is turned on means that these commands do not have to be written one by one in the terminal.

- In addition to this, we have seen the importance of running tests after each iteration. If we see an error we can make
the amendments necessary to make sure all the dependencies for the app are available.


