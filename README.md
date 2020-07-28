# Creating a Multi Vagrant Machine with Linux

## Aims of this activity

### 1) Create a second virtual machine within our vagrant file named "db"

### 2) Configure the db machine with a different IP address from the app

### 3) Provision the db with a MongoDB database

Additionally we can run the test sets to make sure the machines were created
correctly

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

- Before we move onto the next task, we want to check that the existing code that we have is working correctly.
- From the same directory as the vagrant file we run vagrant up, due to our changes if all goes to plan
after the VM named "app" is created, "db" should also be created afterwards

- We can then change directory into our tests folder and run the command "rake spec". By doing this we will know whether
our VMs are working as they should.

![vagrant file](images/vm_test_pass_1.png)



## Task 3

- To be able to connect our VM to the MongoDB server using bash scripts we must update the contents within our 
provision.sh file

- Initial attempts were not so successful and this highlights the importance of using "rake specs"

--> insert a snippet of failed attempts

- After implementing TTD to work towards fixing the issues, we were able to run our tests with zero failures
on both Virtual Machines

 --> another picture

