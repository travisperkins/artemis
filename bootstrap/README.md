<!------------------------------------------------------------------------------------------------>

# bootstrap (work in progress)

###### Since: [v1.1.0]

## Synopsis

[Ansible requires Python 2.x] be installed on inventory hosts. However, distributions are now routinely shipping with Python 3.x installed by default. The objective of the bootstrap role is to ensure all appropriate Python 2.x dependencies are installed on inventory hosts.

The bootstrap role achieves this using the Ansible [script module] - which does not require an existing Python 2.x installation to function - to upload and execute a shell script. The [shell script] will announce its success or failure via return code. Additionally, a flag-file is created exclusively upon successful completion; thus allowing the bootstrap role to attain idempotency.

## Mandatory Inputs

None

## Example Playbook

```
- hosts: <inventory-pattern>

  gather_facts: false

  roles:

    - role: bootstrap
```

By default, Ansible gathers [facts] about inventory hosts; this action will fail on inventory hosts with no Python 2.x installation. Thus, all playbooks invoking the bootstrap role must set **`gather_facts: false`**

## Playbook

A playbook to invoke the bootstrap role is provided for convenience. The [bootstrap playbook] will act against all inventory hosts. After following the [getting started] guide, the [bootstrap playbook] can be invoked thus:

```
    ansible-playbook -i <inventory-specification> bootstrap/bootstrap.yml
```

<!------------------------------------------------------------------------------------------------>

[v1.1.0]:             ../CHANGELOG.md#v110-may-17-2016
[shell script]:       bootstrap/files/bootstrap.sh
[getting started]:    ../README.md#getting-started
[bootstrap playbook]: bootstrap/bootstrap.yml

<!------------------------------------------------------------------------------------------------>

[facts]:                       http://docs.ansible.com/ansible/glossary.html#term-facts
[script module]:               http://docs.ansible.com/ansible/script_module.html
[Ansible requires Python 2.x]: http://docs.ansible.com/ansible/intro_installation.html#managed-node-requirements

<!------------------------------------------------------------------------------------------------>
