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

After running this command, you will find:

 * [The sample base station server running on port 8081](http://localhost:8081)
 * [The sample sensor server running on port 8082](http://localhost:8082)


Usage
-----

Depending on you needs, you will need to follow one of the following instructions:

* Do nothing.
  If you ran _vagrant up_ and everything went smoothly, then everything should be installed and working.

* Do all the magic.
  This option installs _redis_ in the server and installs _rstatus_ in all the machines whose performance wants to be measured.

      ansible-playbook -vvvv -u vagrant --private-key=[private-key-location] -l 'local' -i hosts main.yml

* Just deploy the base station's HTTP server (it serves the app through the port 5000).

        ansible-playbook -vvvv -u vagrant --private-key=[private-key-location] -l 'local' -i hosts basestations.yml

* Just deploy the sensor's HTTP server (it serves the app through the port 5000).

        ansible-playbook -vvvv -u vagrant --private-key=[private-key-location] -l 'local' -i hosts sensors.yml
