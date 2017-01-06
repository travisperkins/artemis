<!------------------------------------------------------------------------------------------------>

# platform/server (work in progress)

###### Since: [v1.0.0]

## Synopsis

The platform/server role is the entry point when using Artemis as an end-to-end operating system automation framework.

platform/server is a *meta-role*, whereby it comprises only [meta dependencies] upon other roles. The dependencies defined within the platform/server role are specifically sequenced to apply Artemis against the target platform in the most economical manner.

**NOTE:** It is considered best practice to [bootstrap] all target platforms before invoking the platform/server role; regardless of necessity.

## Mandatory Inputs

None

## Playbook

<!------------------------------------------------------------------------------------------------>

[v1.0.0]:            ../CHANGELOG.md#v100-april-25-2016
[bootstrap]:         ../../bootstrap/README.md
[meta dependencies]: http://docs.ansible.com/ansible/playbooks_roles.html#role-dependencies

<!------------------------------------------------------------------------------------------------>
