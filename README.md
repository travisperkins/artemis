<!------------------------------------------------------------------------------------------------>

# Artemis

## A comprehensive [Ansible] library and operating system automation framework

**The latest release is [v1.5.1](CHANGELOG.md#v151-april-16-2017) (April 16, 2017)**

See [CHANGELOG] for complete release schedule

###### Licensed under the [Apache License, Version 2.0]

<!------------------------------------------------------------------------------------------------>

## Dependencies

- **Ansible 1.9.x**

  **NOTE: Due to performance regressions in Ansible 2.x, Artemis is being maintained against Ansible 1.9.x.** The situation is being monitored and although performance has improved since 2.0.x, as of this writing, it is still not competitive with 1.9.x. Artemis will be migrated to Ansible 2.x when its performance becomes competitive with 1.9.x ***- October, 2016***

  **UPDATE: Initial testing against Ansible 2.2 has proven extremely promising**; With the Ansible [CHANGELOG](https://github.com/ansible/ansible/blob/devel/CHANGELOG.md) additionally citing **"Major performance improvements"** ***- November, 2016***

<!------------------------------------------------------------------------------------------------>

## Supported Platforms

| **Platform**              | **Approved**       | **Testing**   |
|:--------------------------|:------------------:|:-------------:|
| Debian 8 (Jessie)         | :white_check_mark: | Ongoing       |
| Ubuntu 14.04 LTS (Trusty) | :white_check_mark: | Ongoing       |
| Ubuntu 14.10 (Utopic)     | :white_check_mark: | *End-of-life* |
| Ubuntu 15.04 (Vivid)      | :white_check_mark: | *End-of-life* |
| Ubuntu 15.10 (Wily)       | :white_check_mark: | *End-of-life* |
| Ubuntu 16.04 LTS (Xenial) | :white_check_mark: | Ongoing       |
| Ubuntu 16.10 (Yakkety)    | :white_check_mark: | Ongoing       |
| CentOS 7                  | :white_check_mark: | Ongoing       |
| RHEL 7                    | :white_check_mark: | Infrequent    |

<!------------------------------------------------------------------------------------------------>

## Background

Artemis was born of necessity; which began as a small collection of operating system-centric Ansible roles managing such platform aspects as the hostname, static hosts file, package management, proxy configuration(s), firewall, timezone, NTP and SSH. This modest collection of roles was housed in a shared Ansible codebase under the namespace, *platform*. On *May 15, 2014* - as those initial roles matured and new roles emerged - the platform namespace was split off to form a new codebase, which became known as Artemis. From the outset Artemis has pursued the [abstraction] and [separation of concerns] principles as core tenets. Artemis development continued and [semantic versioning] was adopted on *April 25, 2016*, with the release of [v1.0.0]. Artemis entered the public domain on *January 6, 2017*, seeing [v1.5.0] released open-source.

<!------------------------------------------------------------------------------------------------>

## Synopsis

Artemis is an operating system [infrastructure-as-code] framework, written in [Ansible]. The principal use-case being that of exhaustive end-to-end operating system automation.

The Artemis framework is used to adapt an installation of any [supported platform](#supported-platforms) into a consistent, absolute state; as defined by the out-of-the-box configuration or user-supplied configuration. By design Artemis is entirely [idempotent], hence it can be applied to live infrastructure once, repeatedly, or continuously with no supplementary modification to the system state beyond the initial application. Artemis might also be used during the creation of a [virtual appliance], such as an [Open Virtualisation Format] or [Amazon Machine Image] to serve as a base platform for virtual machines.

A secondary use-case for Artemis is that of a comprehensive operating system-centric Ansible role library. Artemis is comprised of discrete roles, each having a explicit and distinct purpose. Roles depend upon each other to achieve an overall objective. An example of role interdependencies is the following dependency chain:

```
        platform/package/patch -> platform/package/manager -> platform/proxy
```

The objective of the `platform/package/patch` role is to [patch] the system using the platform's native package manager. Hence, to achieve its objective the package manager must first be configured, which is the responsibility of the `platform/package/manager` role. Equally, for the package manager to function it may depend upon proxy configuration, which is the function of the `platform/proxy` role. Combined, these roles achieve the overall objective of patching the system. Wherever possible, interdependencies between roles are minimised in an effort to allow the roles to be used in isolation within a role library. However, use of Artemis as a role library is a secondary objective and role interdependencies are essential in maintaining clean code in accordance with our core tenets of [abstraction] and the [separation of concerns].

<!------------------------------------------------------------------------------------------------>

## Operating System Automation

For use as an end-to-end operating system automation framework, Artemis comprises three principal roles:

- **[bootstrap]**
- **[platform/server]**
- **[platform/terminus]**

<!------------------------------------------------------------------------------------------------>

## Getting Started (Work In Progress)

### Best Practice ansible.cfg

```
[defaults]
transport       = ssh
remote_tmp      = /tmp
roles_path      = <roles-path-1>:<roles-path-2>:<roles-path-3>
ansible_managed = Ansible Managed

[ssh_connection]
ssh_args     = -o ControlMaster=auto -o ControlPersist=3m -o ServerAliveInterval=5 -o ServerAliveCountMax=5 -o TCPKeepAlive=no
pipelining   = True
control_path = /tmp/ssh-mux-%%r-%%h-%%p
```

### Best Practice Play Example

```
- hosts: <inventory_pattern>

  gather_facts: false

  roles:

    - role: bootstrap
    - role: platform/server

    - role: <user-role-1>
    - role: <user-role-2>
    - role: <user-role-3>

    - role: platform/terminus
```

<!------------------------------------------------------------------------------------------------>

## Managed State (Work In Progress)

Artemis has the concept of each target platform being in either a *managed* or *unmanaged* state. The function of which is to facilitate Artemis taking different execution paths dependent on this state.

Discuss patch when unmanaged

<!------------------------------------------------------------------------------------------------>

## Tiered Security Model (Work In Progress)

A Tiered Security Model (TSM) introduces the concept of being in one of a selection of security modes (states). The intention being the each increased mode beings the platform to a further state of heightened security readiness. Each role within Artemis which adopts this model is driven by the value of `security_mode`, which is located in the `shared` role. The value of `security_mode` is verified to be a valid selection of one of the following:

```
        standard - The baseline for any installation
        balanced - The normal security mode, aim for secure-by-default approach in this mode
        enhanced - Highest level of security hardening
```

The approach taken by Artemis to security via the “balanced” and “enhanced” tiers TSM aspires to be compliant to the objectives of the Center for Internet Security (CIS) L1 benchmark. Most of the work completed thus far has been hardening of SSH, kernel parameters affecting network behaviour, hardening of cron files etc.  

A Lynis (https://cisofy.com/lynis/) configuration file, with the option to download Lynis and run a compliance check of a resultant build against the CIS benchmark will soon be included in the project.

<!------------------------------------------------------------------------------------------------>

## Overrides (Work In Progress)

Using [include_vars](http://docs.ansible.com/ansible/include_vars_module.html) is necessary for Artemis to maintain clean code, with good seperation of concerns. Overrides are a dirty trick, but one required to overcome the [variable precedence](http://docs.ansible.com/ansible/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable) of Ansible.

<!------------------------------------------------------------------------------------------------>

## Role Support Matrix

| **Role**                      | **Debian 8**       | **Ubuntu 14**      | **Ubuntu 15**      | **Ubuntu 16**      | **CentOS 7**       | **RHEL 7**         |
|:------------------------------|:------------------:|:------------------:|:------------------:|:------------------:|:------------------:|:------------------:|
| **boot/grub/cmdline**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **boot/grub/control**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **boot/grub/shared**          | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **boot/initramfs**            | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **[bootstrap]**               | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **filesystem/btrfs**          | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **filesystem/ext**            | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **kernel/sysctl**             | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **logging/logrotate**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **network/ipv6**              | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **network/shared**            | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/bounce**           | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/cron/allow**       | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/cron/daemon**      | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/cron/deny**        | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/cron/shared**      | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/dac**              | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/firewall**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/halt**             | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/hostname**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/hosts**            | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/issue**            | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/locale**           | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/mac**              | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/managed**          | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/motd**             | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/ntpd**             | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/package/apt**      | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                | :x:                |
| **platform/package/manager**  | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/package/patch**    | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/ping**             | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/proxy**            | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **[platform/server]**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/ssh/agent**        | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/ssh/auth**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/ssh/client**       | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/ssh/common**       | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/ssh/daemon**       | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/ssh/key**          | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/su**               | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/sysstat**          | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **[platform/terminus]**       | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **platform/timezone**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **process-control/init-sysv** | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                | :x:                |
| **process-control/systemd**   | :white_check_mark: | :x:                | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **shared**                    | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **user**                      | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **volume/lvm/common**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **volume/lvm/group**          | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **volume/lvm/volume**         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **Role**                      | **Debian 8**       | **Ubuntu 14**      | **Ubuntu 15**      | **Ubuntu 16**      | **CentOS 7**       | **RHEL 7**         |

<!------------------------------------------------------------------------------------------------>

## Author

- **[Katherine Albany]** (Self Appointed [BDFL])

<!------------------------------------------------------------------------------------------------>

## Honorary Mentions

- **[Richard Lees]**
- **[Tom Elliff]**

<!------------------------------------------------------------------------------------------------>

## Contributors

- **[Christopher Armstrong]**
- **[Dave Rix]**
- **[Ionut Craciunescu]**
- **[Richard Lees]**
- **[Martin Devlin]**
- **[Tom Elliff]**
- **[Yasin Amadmia]**

<!------------------------------------------------------------------------------------------------>

[Christopher Armstrong]: https://github.com/kristophuk
[Dave Rix]:              https://github.com/hasgaroth
[Ionut Craciunescu]:     https://github.com/yoz2326
[Katherine Albany]:      https://github.com/katherinealbany
[Richard Lees]:          https://github.com/rlees85
[Martin Devlin]:         https://github.com/devlinmr
[Tom Elliff]:            https://github.com/tomelliff
[Yasin Amadmia]:         https://github.com/geek876

<!------------------------------------------------------------------------------------------------>

[v1.0.0]:                      CHANGELOG.md#v100-april-25-2016
[v1.5.0]:                      CHANGELOG.md#v150-january-4-2017
[CHANGELOG]:                   CHANGELOG.md
[bootstrap]:                   bootstrap/README.md
[platform/server]:             platform/server/README.md
[platform/terminus]:           platform/terminus/README.md
[Apache License, Version 2.0]: LICENSE

<!------------------------------------------------------------------------------------------------>

[BDFL]:                       https://en.wikipedia.org/wiki/Benevolent_dictator_for_life
[patch]:                      https://en.wikipedia.org/wiki/Patch_(computing)
[Ansible]:                    https://www.ansible.com
[idempotent]:                 https://en.wikipedia.org/wiki/Idempotence
[abstraction]:                https://en.wikipedia.org/wiki/Abstraction_principle_(computer_programming)
[virtual appliance]:          https://en.wikipedia.org/wiki/Virtual_appliance
[semantic versioning]:        http://semver.org
[Amazon Machine Image]:       https://en.wikipedia.org/wiki/Amazon_Machine_Image
[infrastructure-as-code]:     https://en.wikipedia.org/wiki/Infrastructure_as_Code
[separation of concerns]:     https://en.wikipedia.org/wiki/Separation_of_concerns
[Open Virtualisation Format]: https://en.wikipedia.org/wiki/Open_Virtualization_Format

<!------------------------------------------------------------------------------------------------>
