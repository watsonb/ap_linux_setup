# ap_linux_setup

A collection of playbooks, plays, tasks, and other items to configure a "fresh"
Linux environment the way I like it.

> NOTE: "fresh" means a fairly vanilla installation.  Obviously there will be
> some bootstrapping required to get Ansible installed locally initially, but
> after that, I want to run playbooks.

## Current Version

![Version](https://img.shields.io/badge/version-v0.1.0-blue.svg)

See [VERSION](./VERSION.md) for notes/history.

## Required Roles

See [requirements.yml](roles/requirements.yml)

## Required Collections

See [requirements.yml](collections/requirements.yml)

## Variables

Check out documentation for the above roles for configurable variables. Below,
are variables specific to this playbook project.

### Common Variables

> TODO: document


## Examples

> TODO: document

## License

MIT

## Author Information

|Author|E-mail|
|:-----|:-----|
|Ben Watson|bwatson1979@gmail.com|

## Playbook Development Information

### Contributing

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request

### Git SCM

Please refer to the .gitignore file and update accordingly depending on your
development environment, etc.  The particular file was generated at
[gitignore.io](https://www.gitignore.io/) and contains settings for the following:

- Ansible
- Python
- Vim
- Eclipse
- IntelliJ IDEA
- Linux
- Windows
  
### Versioning

Please update [VERSION.md](./VERSION.md) as you release new versions of your role and try to
abide by [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

### Self-contained

Please try to keep this playbook as self-contained as possible such that it may
be used with multiple inventories.
