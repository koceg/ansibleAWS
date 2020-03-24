### AWS Ansible Docker Image
Idea is everyone to have some common ground for debugging and running AWS ansible playbooks.

This Image also contains openshift/OKD 4.x `openshift-install` cli program , to aid in infrastructure preparation and later openshift/OKD cluster deployment.<br>

You can find more information at the related project [aws.openshift.okd](https://github.com/koceg/aws.openshift.okd)

**Prerequisite**
- docker-ce version 19.03.8 or newer installed
- change **OKD_VERSION** to point to the desired openshift/OKD `openshift-install` version to be used [origin-release](https://origin-release.svc.ci.openshift.org/)

**Image Build:**
```bash
cd ansibleAWS
docker build .
docker tag ( ansible_image_hash ) ansible:aws
```
**Container Start:**
```bash
cd ( playbooks_dir )
docker run -it -v $PWD:/playbooks --rm ansible:aws bash
```
**Running Playbooks:**
```bash
ansible-playbook -i ( path to inventoryFile ) /playbooks/example_playbook.yaml
```