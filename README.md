
MDDOC
=====

This project generates documentation from within an ansible role in markdown
format. This project was created because I was tired of trying to generate
documentation for complicated Ansible roles. It is an incredibly basic
parser with a slightly less simple Makefile that generates the README for
a project

Feel free to use this in any project you have.

Usage
-----

To use this software, copy the Makefile and the mddoc script to the main
directory of your Ansible role. Once done, you may need to edit the Makefile.

By default, mddoc and the Makefile will parse files within role directories
with the following ordering:

1. meta
1. defaults
1. vars
1. tasks
1. handlers
1. files
1. templates

So, yml files within the meta directory will be parsed first, followed by
defaults, then vars, tasks, handlers, files and templates.

space should be included as part of the documentation string). It will not
parse other comments out of the file at this time. The mddoc parser is
incredibly simple, and will not understand anything else at this time.

To run the documentation parser, simply run ```make``` at the root of your
Ansible role.

Default Variables
-----------------

Here is where we describe the role, in moderate detail.

Description... Description, etc...

The following variables are available

* __Var1__: Variable 1
* __Var2__: Variable 2



Tasks
-----

Here will will describe the tasks that we will be performing with this role.

If there are any other things that happen as part of running these roles, we should also describe it here.


- name: Task 1
---

Handlers
--------

- name: Handler
  command: handle it

Template
--------

This is where we describe the template.
