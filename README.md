### AWS Ansible Docker Image

The idea is everyone to have some common ground for debugging and running ansible playbooks

inside _Dockerfile_ is example how this should be run

NOTE: because we don't get a propper shell enviroment  we need to navige inside **$HOME/.local/bin**    
and execute our ansible scripts with the following command

```bash
./ansible-playbook -i ( inventoryFile ) /playbookRepo/(path to playbook).yml
```
