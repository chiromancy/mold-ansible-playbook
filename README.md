# Ansible Mold

A boilerplate repository for Ansible playbooks (and roles?)

# TODO
* Will CI not see failures because we're ignoring errors in Makefile?
* Change sample role to add a file to the system
* Add basic test to test for presence of file on system
* Add Makefile target for downloading/updating mitogen
* Add ability to test multi-host ansible plays

# DONE
* Add test-infra to test directory
* Add makefile target to build image and run playbook
* Add docker inventory for local docker testing
