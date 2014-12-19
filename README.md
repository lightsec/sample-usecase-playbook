sample-usecase-playbook
=======================

Sample scenario running on VMs.

Requirements
------------

You must install [Ansible](http://www.ansible.com).

    user:~$ mkvirtualenv ansibleve
    (ansibleve) user:~$ pip install ansible

 
Furthermore, you will probably want to install [Vagrant](https://www.vagrantup.com/) to run the script as it is.
You can also change hosts file and use already existing machines.


Creation of the experimental environment
----------------------------------------

This [Ansible playbook](http://docs.ansible.com/playbooks.html) will create the following environment:

 * A [sample base station](https://github.com/lightsec/http_bs_lightsec).
 * A [sample sensor](https://github.com/lightsec/http_sensor_lighsec).
 * A user client which [access to the sensor data using the information provided by the base station](https://github.com/lightsec/liblightsec).

To simply create these machines using [Vagrant](https://www.vagrantup.com/) go to _the root directory of this project_ and run:

    vagrant up
