# Beaker Project Infrastructure Management using Ansible

## Introduction

Beaker is open-source software for managing and automating labs of test computers.

This repository contains Ansible rules to manage the Beaker infrastructure.

You need `Ansible >=2.3` to be able to handle the (new) YAML-based 'hosts' file format.

However, we strongly recommend using `Ansible >= 2.7.5`. You can install all
necessary requirements via command `pip install -r requirements.txt`.

## Admin-specific Production Settings

You can use `group_vars/all/local_settings.yml` for you local
settings like `ansible_become_pass` if your computer storage is
encrypted. Use `--ask-sudo-pass` if you don't want to use this
method. Currently Ansible is unable to ask _when needed_ so
the global setting has been disabled in `ansible.cfg`.

## Dealing with Secrets

We use Ansible Vault (`ansible-vault` command) to hide some parameters
like service credentials or emails to avoid SPAM.

To make it easy all such files are named '\*.vault.yml' and git
attributes are defined to make diff-ing and merging easy.

Your config needs to be enhanced to tell git how to handle these files.
This is very easy, look at this URL for more info:
  https://github.com/building5/ansible-vault-tools

## Improving Ansible Speed

Ansible is slow, but there's a nice project to improve its performance.
It still has glitches so it's not enabled by default, but it's easy to enable it.

First install the library (it is not yet packaged):

`pip install mitogen`

Then you just need to run playbooks this way:

`ANSIBLE_STRATEGY=mitogen_linear ansible-playbook …`

