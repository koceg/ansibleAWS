### AWS Ansible Docker Image

The idea is everyone to have some common ground for debugging and running ansible playbooks

**Container Start:**   
```bash
docker run -it -v $PWD:/playbooks --rm ansible:aws bash
```

**Running Playbooks:**   
```bash
ansible-playbook -i ( path to inventoryFile ) /playbooks/(path to playbook).yaml
```
