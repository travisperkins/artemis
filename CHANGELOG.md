<!------------------------------------------------------------------------------------------------>

[//]: # (# **[Unreleased](https://github.com/travisperkins/artemis/compare/<latest release>...HEAD) (HEAD)**)

<!------------------------------------------------------------------------------------------------>

# **[Unreleased](https://github.com/travisperkins/artemis/compare/v1.5.2...HEAD) (HEAD)**

## NOTES:
1. Globally adopt dynamic task includes
1. Globally adopt enclosing **with** clause variables in Jinja2 expression syntax
1. **This release is primarily a porting of v1.5.2 to achieve compatibility with Ansible >= 2.2.1.x**

### platform/locale
- **Port:** Remove double quotation mark escape characters - [Katherine Albany], [Richard Lees]

### platform/package/patch
- **Port:** Adopt apt module autoremove functionality - [Katherine Albany]
- **Port:** Restore idempotency by combining apt update and upgrade tasks - [Katherine Albany]

### platform/ping
- **Port:** Mute execute task change indicator - [Katherine Albany], [Richard Lees]

### platform/ssh/daemon
- **Bugfix:** Prevent **AcceptEnv** being configured without valid content - [Katherine Albany]

### platform/sysstat
- **Port:** Remove double quotation mark escape characters - [Katherine Albany], [Richard Lees]

### shared
- **Port:** **ansible_ssh_host** becomes **ansible_host** - [Katherine Albany], [Richard Lees]
- **Port:** **ansible_ssh_port** becomes **ansible_port** - [Katherine Albany], [Richard Lees]

<!------------------------------------------------------------------------------------------------>

# **[v1.5.2](https://github.com/travisperkins/artemis/compare/v1.5.1...v1.5.2) (August 15, 2017)**

## NOTES:
1. Verified support for Debian 9 (Stretch)
1. Verified support for Ubuntu 17.04 (Zesty)
1. Ubuntu 16.10 (Yakkety) reaches end-of-life

### platform/cron/allow
- **Bugfix:** Allow multiple invocations from user role meta dependencies - [Richard Lees]

### platform/ntpd
- **Change:** Replace use of deprecated **ntpdate** with **ntpd** - [Katherine Albany]

<!------------------------------------------------------------------------------------------------>

# **[v1.5.1](https://github.com/travisperkins/artemis/compare/v1.5.0...v1.5.1) (April 16, 2017)**

## NOTES:
1. Globally adopt **trim** during variable length validation

### boot/grub/control
- **Bugfix:** Incomplete task tagging - [Katherine Albany]

### kernel/sysctl
- **Change:** Adoption of shared distribution abstractions - [Katherine Albany]

### platform/bounce
- **Change:** Adoption of shared distribution abstractions - [Katherine Albany]

### platform/halt
- **Change:** Adoption of shared distribution abstractions - [Katherine Albany]

### platform/locale
- **Change:** Adoption of shared distribution abstractions - [Katherine Albany]

### platform/timezone
- **Change:** Adoption of shared distribution abstractions - [Katherine Albany]

### shared
- **New:** Distribution major version abstractions - [Katherine Albany]

<!------------------------------------------------------------------------------------------------>

# **[v1.5.0](https://github.com/travisperkins/artemis/releases/tag/v1.5.0) (January 4, 2017)**

## NOTES:
1. All roles now use **become** as required
1. The **artemis/** prefix has been removed from all role paths

### filesystem/btrfs
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]

### logging/logrotate
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]

### network/shared
- **New:** ipv4/ipv6 loopback domain name abstractions - [Katherine Albany]

### platform/bounce
- **Bugfix:** Allow **stat** task to follow symlinks - [Dave Rix]

### platform/cron/allow
- **Remove:** Inconsistent use of Jinja2 **trim** validation - [Katherine Albany]

### platform/cron/daemon
- **Bugfix:** Allow **stat** task to follow symlinks - [Dave Rix]
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]

### platform/cron/deny
- **Remove:** Inconsistent use of Jinja2 **trim** validation - [Katherine Albany]

### platform/cron/shared
- **Bugfix:** Allow **stat** tasks to follow symlinks - [Dave Rix]

### platform/firewall
- **Bugfix:** Always start UFW service, regardless of requested firewall state - [Katherine Albany]
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]

### platform/hostname
- **New:** Adopt **dynamic_identity** flag; disabling role functionality - [Katherine Albany]

### platform/hosts
- **Bugfix:** Adopt **network/shared** loopback domain naming - [Katherine Albany]
- **New:** Allow additional entries through **hosts_entries** - [Katherine Albany]
- **New:** Adopt **dynamic_identity** flag; disabling role functionality - [Katherine Albany]
- **Remove:** Inconsistent use of Jinja2 **trim** validation - [Katherine Albany]

### platform/locale
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]

### platform/mac
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]

### platform/motd
- **Change:** Allow indirection of **Host** value - [Katherine Albany]
- **Change:** Allow indirection of **FQDN** value - [Katherine Albany]
- **New:** Adopt use of **dynamic_hardware** flag in hardware section - [Katherine Albany]
- **Change:** Remove kernel section if **ansible_kernel** fact may have become unrepresentative - [Katherine Albany]
- **Bugfix:** Allow **stat** task to follow symlinks - [Dave Rix]
- **New:** Adopt **dynamic_identity** flag; disabling identity section - [Katherine Albany]

### platform/ntpd
- **Bugfix:** Relocate drift file to avoid permission denied - [Katherine Albany]
- **Bugfix:** Allow **stat** task to follow symlinks - [Dave Rix]
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]
- **Bugfix:** Jinja2 variable validation includes aditional **length** checks - [Katherine Albany]
- **Remove:** Inconsistent use of Jinja2 **trim** validation - [Katherine Albany]

### platform/package/apt
- **Change:** Facilitate lazy loading of distribution variant configuration - [Katherine Albany], [Richard Lees]
- **Remove:** Inconsistent use of Jinja2 **trim** validation - [Katherine Albany]

### platform/package/patch
- **Bugfix:** Allow **stat** task to follow symlinks - [Dave Rix]
- **New:** Allow different APT upgrade modes depending on 'managed' state - [Katherine Albany]

### platform/proxy
- **Change:** Adopt use of **ansible_hostname**, **ansible_domain**, **ansible_fqdn** facts - [Katherine Albany]
- **Bugfix:** Jinja2 variable validation includes aditional **not none** checks - [Katherine Albany]

### platform/ssh/daemon
- **Bugfix:** Pass **sshd_port** into **platform/firewall** meta dependency - [Katherine Albany]
- **New:** **sshd_bounce_prevention** flag; Allows disabling daemon restart - [Katherine Albany]
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]
- **Remove:** Inconsistent use of Jinja2 **trim** validation - [Katherine Albany]

### platform/su
- **Remove:** Inconsistent use of Jinja2 **trim** validation - [Katherine Albany]

### platform/sysstat
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]

### process-control/systemd
- **Bugfix:** Jinja2 variable validation includes aditional **not none** and **length** checks - [Katherine Albany]

### shared
- **New:** Lazy fact gathering - [Katherine Albany]
- **New:** **dynamic_hardware** flag; facilitates adaptation to dynamic hardware environments - [Katherine Albany]
- **Bugfix:** Allow **stat** task to follow symlinks - [Dave Rix]
- **New:** **dynamic_identity** flag; facilitates adaptation to dynamic hosting environments - [Katherine Albany]
- **New:** **deployment_mode** abstractions; configures shared facts to target disparate deployment environments - [Katherine Albany]

### user
- **Bugfix:** Allow **stat** task to follow symlinks - [Dave Rix]
- **New:** Allow optional discretionary access control over user base directory - [Richard Lees]

### volume/lvm/common
- **Bugfix:** Replace **platform/package/patch** meta dependency with **platform/package/manager** - [Katherine Albany]

<!------------------------------------------------------------------------------------------------>

# **v1.4.0 (November 1, 2016)**

## NOTES:
1. **platform/package/manager** takes over from **platform/package** as the entry point for package management
1. **platform/package** renamed to **platform/package/apt**
1. **platform/patch** renamed to **platform/package/patch**

### boot/grub/cmdline
- **New:** Control of kernel command-line through **GRUB_CMDLINE_LINUX** - [Katherine Albany]

### boot/grub/control
- **New:** Overall administration of the GRand Unified Bootloader (GRUB) - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]

### boot/grub/shared
- **New:** Functionality shared across **boot/grub/*** roles - [Katherine Albany]

### boot/initramfs
- **New:** Administration of the "initial RAM file system" (initramfs) - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]

### filesystem/btrfs
- **New:** Control generic **ro/rw** mount options - [Katherine Albany]
- **New:** Control generic **dev/nodev** mount options - [Katherine Albany]
- **New:** Control generic **suid/nosuid** mount options - [Katherine Albany]
- **New:** Control generic **exec/noexec** mount options - [Katherine Albany]
- **New:** Control generic **auto/noauto** mount options - [Katherine Albany]
- **New:** Control generic **user/nouser** mount options - [Katherine Albany]
- **New:** Control generic **atime/noatime** mount options - [Katherine Albany]
- **New:** Control Btrfs (B-tree file system) specific **compress** mount option - [Katherine Albany]
- **New:** Control Btrfs (B-tree file system) specific **recovery** mount option - [Katherine Albany]
- **New:** Control Btrfs (B-tree file system) specific **space_cache** mount option - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### filesystem/ext
- **New:** Control generic **ro/rw** mount options - [Katherine Albany]
- **New:** Control generic **dev/nodev** mount options - [Katherine Albany]
- **New:** Control generic **suid/nosuid** mount options - [Katherine Albany]
- **New:** Control generic **exec/noexec** mount options - [Katherine Albany]
- **New:** Control generic **auto/noauto** mount options - [Katherine Albany]
- **New:** Control generic **user/nouser** mount options - [Katherine Albany]
- **New:** Control generic **atime/noatime** mount options - [Katherine Albany]

### kernel/sysctl
- **New:** Allow variable overriding - [Katherine Albany]

### logging/logrotate
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### network/ipv6
- **New:** Administration of IPv6 protocol stack - [Katherine Albany]

### network/shared
- **New:** Functionality shared across **network/*** roles - [Katherine Albany]

### platform/bounce
- **Change:** Removed redundant stat checksumming overhead - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]
- **New:** Adopt SSH connection pause time - [Katherine Albany]

### platform/cron/daemon
- **Change:** Removed redundant stat checksumming overhead - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### platform/cron/shared
- **Change:** Removed redundant stat checksumming overhead - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]

### platform/dac
- **New:** Administration of Discretionary Access Controls (DAC) - [Katherine Albany], [Richard Lees]
- **New:** Allow variable overriding - [Katherine Albany]

### platform/firewall
- **New:** Allow variable overriding - [Katherine Albany]
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### platform/halt
- **New:** Allow variable overriding - [Katherine Albany]

### platform/hosts
- **Bugfix:** Missing dependency on **shared** role - [Katherine Albany]
- **New:** Dependency on **network/shared** role - [Katherine Albany]
- **New:** IPv6 loopback support - [Katherine Albany]
- **New:** IPv6 **allnodes** link-local multicast support - [Katherine Albany]
- **New:** IPv6 **allrouters** link-local multicast support - [Katherine Albany]

### platform/issue
- **New:** Allow variable overriding - [Katherine Albany]

### platform/locale
- **New:** Allow variable overriding - [Katherine Albany]
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### platform/mac
- **Change:** Refactored GRand Unified Bootloader (GRUB) functionality out into new **boot/grub/control** and **boot/grub/cmdline** roles - [Katherine Albany]
- **Change:** Refactored "initial RAM file system" (initramfs) functionality out into new **boot/initramfs** role - [Katherine Albany]
- **New:** Integration of **boot/grub/cmdline** role - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### platform/motd
- **New:** Time Zone section - [Katherine Albany]
- **New:** UTC Clock section - [Katherine Albany]
- **New:** Firewall section - [Katherine Albany]
- **New:** IPv6 section - [Katherine Albany]
- **New:** Mandatory Access Controls (MAC) section - [Katherine Albany]
- **Change:** Removed redundant stat checksumming overhead - [Katherine Albany]
- **Change:** Variable override indicator - [Katherine Albany]
- **Change:** Remove **pam_mail.so/pam_lastlog.so** from **sshd/login** PAM (Pluggable Authentication Module) definitions - [Katherine Albany]

### platform/ntpd
- **New:** Dependency on **network/shared** role - [Katherine Albany]
- **Change:** Removed redundant stat checksumming overhead - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### platform/package >>> platform/package/apt
- **Change:** Facilitate highly bespoke Advanced Package Tool (APT) configurations - [Katherine Albany]
- **New:** Advanced Package Tool (APT) configuration for Debian platforms - [Katherine Albany]

### platform/package/manager
- **New:** Conditional dependency on **platform/package/apt** - [Katherine Albany]

### platform/patch >>> platform/package/patch
- **Change:** Removed redundant stat checksumming overhead - [Katherine Albany]
- **Change:** Removed dependency **platform/proxy** - [Katherine Albany]
- **Change:** Dependency **platform/package** renamed to **platform/package/manager** - [Katherine Albany]

### platform/ping
- **New:** Adopt SSH connection pause time - [Katherine Albany]

### platform/proxy
- **New:** Dependency on **network/shared** role - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]

### platform/server
- **Bugfix:** Prevent "double bounce" caused by dependency ordering  - [Katherine Albany]
- **New:** Integration of **boot/grub/control** role - [Katherine Albany]
- **New:** Integration of **network/ipv6** role - [Katherine Albany]
- **New:** Integration of **platform/dac** role - [Katherine Albany]
- **New:** Integration of **platform/su** role - [Katherine Albany]
- **Change:** Dependency reordering to achieve idempotency - [Katherine Albany]
- **Change:** Dependency **platform/package** renamed to **platform/package/manager** - [Katherine Albany]
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### platform/ssh/common
- **New:** Allow variable overriding - [Katherine Albany]

### platform/ssh/daemon
- **New:** Dependency on **network/shared** role - [Katherine Albany]
- **Bugfix:** Change default **PermitRootLogin** value to **without-password** - [Katherine Albany]
- **New:** Allow variable overriding - [Katherine Albany]
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### platform/su
- **New:** Regulate **su** access using PAM (Pluggable Authentication Module) - [Katherine Albany]

### platform/sysstat
- **New:** Allow variable overriding - [Katherine Albany]
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

### platform/terminus
- **New:** Integration of **boot/grub/control** role - [Katherine Albany]
- **New:** Integration of **boot/initramfs** role - [Katherine Albany]

### platform/timezone
- **New:** Allow variable overriding - [Katherine Albany]

### shared
- **Change:** Removal of GRand Unified Bootloader (GRUB) abstractions - [Katherine Albany]
- **New:** Abstract away all references to **ansible_distribution_release** fact - [Katherine Albany]
- **New:** Variable override abstractions and verification - [Katherine Albany]
- **New:** SSH connection pause time - [Katherine Albany]
- **Change:** Abstract away all PAM (Pluggable Authentication Module) references - [Katherine Albany]

### user
- **Change:** Removed redundant stat checksumming overhead - [Katherine Albany]
- **Bugfix:** Force boolean cast on cron flag variables - [Tom Elliff]

### volume/lvm/common
- **Change:** Dependency **platform/patch** renamed to **platform/package/patch** - [Katherine Albany]

<!------------------------------------------------------------------------------------------------>

# **v1.3.0 (September 15, 2016)**

### filesystem/btrfs
- **New:** Dependency on **platform/cron/daemon** role - [Richard Lees]

### kernel/sysctl
- **Change:** Adoption of TSM (Tiered Security Model) security mode 'includes/excludes' abstractions - [Katherine Albany]

### platform/cron/allow
- **New:** Administration of **cron.allow** access control - [Katherine Albany]

### platform/cron/daemon
- **New:** Administration of cron daemon - [Katherine Albany], [Richard Lees]

### platform/cron/deny
- **New:** Administration of **cron.deny** access control - [Katherine Albany]

### platform/cron/shared
- **New:** Functionality shared across **platform/cron/*** roles - [Katherine Albany]

### platform/firewall
- **New:** Adoption of TSM (Tiered Security Model) - [Katherine Albany]
- **Change:** Allow UFW logging level to be configured while inactive - [Katherine Albany]

### platform/issue
- **New:** Management of system login banner - [Katherine Albany]
- **New:** Adoption of TSM (Tiered Security Model) - [Katherine Albany]
- **New:** Allow role toggling to accommodate edge use-cases - [Katherine Albany]

### platform/motd
- **Bugfix:** Fixed integer to boolean cast in rotational storage section - [Katherine Albany]

### platform/ntpd
- **New:** Adoption of TSM (Tiered Security Model) - [Katherine Albany]
- **New:** Access control in accordance with [RFC 5905](https://www.ietf.org/rfc/rfc5905.txt) - [Katherine Albany]
- **New:** Rate management in accordance with [RFC 5905](https://www.ietf.org/rfc/rfc5905.txt) - [Katherine Albany]
- **Change:** Allow UFW rules to be configured while inactive - [Katherine Albany]
- **Change:** Automatic access control adjustments when peering detected - [Katherine Albany]
- **New:** Allow configuration of **driftfile** - [Katherine Albany]
- **New:** Allow configuration of **logconfig** - [Katherine Albany]
- **New:** Allow configuration of **pool** source type - [Katherine Albany]
- **New:** Detection of **server/pool** exclusivity - [Katherine Albany]
- **New:** Allow configuration of **burst** source flag - [Katherine Albany]
- **New:** Allow configuration of **iburst** source flag - [Katherine Albany]
- **New:** Allow configuration of **source** access restrictions - [Katherine Albany]
- **New:** IPv6 Configuration driven by **network_ipv6** shared flag - [Katherine Albany]

### platform/proxy
- **New:** Allow configuration of HTTP/HTTPS tunneling through use of **proxy_secure** flag - [Katherine Albany], [Richard Lees]

### platform/server
- **New:** Integration of **platform/cron/daemon** role - [Richard Lees]

### platform/ssh/daemon
- **New:** Adoption of TSM (Tiered Security Model) - [Katherine Albany]
- **New:** Allow configuration of **AddressFamily** - [Katherine Albany]
- **New:** Allow configuration of **AllowGroups** - [Katherine Albany]
- **New:** Allow configuration of **AllowUsers** - [Katherine Albany]
- **New:** Allow configuration of **Banner** - [Katherine Albany]
- **New:** Allow configuration of **Compression** - [Katherine Albany]
- **New:** Allow configuration of **ClientAliveCountMax** - [Katherine Albany]
- **New:** Allow configuration of **ClientAliveInterval** - [Katherine Albany]
- **New:** Allow configuration of **HostKey** - [Katherine Albany]
- **New:** Allow configuration of **KexAlgorithms** - [Katherine Albany]
- **New:** Allow configuration of **LoginGraceTime** - [Katherine Albany]
- **New:** Allow configuration of **MACs** - [Katherine Albany]
- **New:** Allow configuration of **MaxSessions** - [Katherine Albany]
- **New:** Allow configuration of **MaxStartups** - [Katherine Albany]
- **New:** Configuration verification before alteration of service state - [Katherine Albany]

### process-control/systemd
- **New:** Allow configuration of **LimitNOFILE** - [Ionut Craciunescu]

### shared
- **Change:** TSM (Tiered Security Model) security mode 'includes/excludes' abstractions - [Katherine Albany]
- **New:** IPv4/6 loopback name/address abstractions - [Katherine Albany]

### user
- **New:** Dependency on **platform/cron/daemon** role - [Richard Lees]
- **New:** Integration of **platform/cron/allow** role - [Katherine Albany]

---------------------------------------------------------------------------------------------------

# **v1.2.0 (August 3, 2016)**

### platform/hostname
- **Change:** Refresh facts when changing hostname - [Katherine Albany]

### platform/hosts
- **Change:** Refresh facts when changing hosts file - [Katherine Albany]

### kernel/sysctl
- **New:** Adoption of TSM (Tiered Security Model) - [Katherine Albany]

### platform/motd
- **Change:** Include virtualisation role in hypervisor section - [Katherine Albany]
- **New:** Packaging section - [Katherine Albany]
- **New:** Storage section - [Katherine Albany]
- **New:** Swap section - [Katherine Albany]
- **New:** Security section - [Katherine Albany]

### shared
- **New:** Tiered Security Model (TSM) - [Katherine Albany]
- **New:** Abstract away all references to **ansible_os_family** fact - [Katherine Albany]
- **New:** Abstract away all references to **ansible_pkg_mgr** fact - [Katherine Albany]
- **New:** Abstract away all references to **ansible_distribution** fact - [Katherine Albany]

---------------------------------------------------------------------------------------------------

# **v1.1.1 (July 13, 2016)**

### filesystem/btrfs
- **Change:** Make mount point access enforcement optional - [Katherine Albany]

### platform/managed
- **Change:** Removed enforced bounce when not 'managed' - [Katherine Albany]

### platform/motd
- **Change:** Moved from **platform/server** to **platform/terminus** to capture kernel version changes after bounce - [Katherine Albany]
- **Change:** Replaced **host_name**/**host_domain** variables with **ansible_hostname**/**ansible_fqdn** facts - [Katherine Albany]
- **New:** User-space architecture section and distribution release name - [Katherine Albany]
- **New:** Artemis version and 'managed' state sections - [Katherine Albany]

### platform/ntpd
- **Change:** Time synchronisation can be forced while in a 'managed' state - [Katherine Albany]
- **New:** Allow configuration of ntpdate samples - [Katherine Albany]

### platform/patch
- **Change:** Play now calls **platform/motd** after **platform/bounce** - [Katherine Albany]

### platform/ssh/daemon
- **New:** Lockdown cipher suites in accordance with [RFC 4344](https://www.ietf.org/rfc/rfc4345.txt) - [Katherine Albany]
- **New:** Allow configuration of **PermitRootLogin** - [Katherine Albany]

### process-control/systemd
- **New:** Allow configuration of **SuccessExitStatus** - [Richard Lees]

### shared
- **New:** Artemis version variable - [Katherine Albany]

### volume/lvm/common
- **Change:** Change dependency from **platform/package** to **platform/patch** - [Katherine Albany]

---------------------------------------------------------------------------------------------------

# **v1.1.0 (May 17, 2016)**

### bootstrap
- **New:** Installation of ansible dependencies on vanilla platforms - [Katherine Albany]

### platform/ping
- **Change:** Removed python dependencies - [Katherine Albany]

---------------------------------------------------------------------------------------------------

# **v1.0.0 (April 25, 2016)**

### Initial release subsequent to adoption of [semantic versioning](http://semver.org/)

- **New:** filesystem/btrfs - [Katherine Albany]
- **New:** filesystem/ext - [Katherine Albany]
- **New:** kernel/sysctl - [Katherine Albany]
- **New:** logging/logrotate - [Katherine Albany]
- **New:** platform/bounce - [Katherine Albany]
- **New:** platform/firewall - [Katherine Albany]
- **New:** platform/halt - [Katherine Albany]
- **New:** platform/hostname - [Katherine Albany]
- **New:** platform/hosts - [Katherine Albany]
- **New:** platform/locale - [Katherine Albany]
- **New:** platform/mac - [Katherine Albany]
- **New:** platform/managed - [Katherine Albany]
- **New:** platform/motd - [Katherine Albany]
- **New:** platform/ntpd - [Katherine Albany]
- **New:** platform/package - [Katherine Albany]
- **New:** platform/patch - [Katherine Albany]
- **New:** platform/ping - [Katherine Albany]
- **New:** platform/proxy - [Katherine Albany]
- **New:** platform/server - [Katherine Albany]
- **New:** platform/ssh/agent - [Katherine Albany]
- **New:** platform/ssh/auth - [Katherine Albany]
- **New:** platform/ssh/client - [Katherine Albany]
- **New:** platform/ssh/common - [Katherine Albany]
- **New:** platform/ssh/daemon - [Katherine Albany]
- **New:** platform/ssh/key - [Katherine Albany]
- **New:** platform/sysstat - [Katherine Albany]
- **New:** platform/terminus - [Katherine Albany]
- **New:** platform/timezone - [Katherine Albany]
- **New:** process-control/init-sysv - [Katherine Albany]
- **New:** process-control/systemd - [Katherine Albany]
- **New:** shared - [Katherine Albany]
- **New:** volume/lvm/common - [Katherine Albany]
- **New:** volume/lvm/group - [Katherine Albany]
- **New:** volume/lvm/volume - [Katherine Albany]
- **New:** user - [Katherine Albany]

<!------------------------------------------------------------------------------------------------>

[Dave Rix]:          https://github.com/hasgaroth
[Ionut Craciunescu]: https://github.com/yoz2326
[Katherine Albany]:  https://github.com/katherinealbany
[Richard Lees]:      https://github.com/rlees85
[Tom Elliff]:        https://github.com/tomelliff

<!------------------------------------------------------------------------------------------------>
