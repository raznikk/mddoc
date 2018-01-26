---

MDDOC
=====

*NOTE:* This project both a proof of concept and a work in progress. It's current incarnation is by no means final. I intend to generate a parser with a more robust language, similar to javadoc.

This project generates documentation from within an ansible role in markdown format. This project was created because I was tired of trying to generate documentation for complicated Ansible roles. It is an incredibly basic parser with a slightly less simple Makefile that generates the README for a project.

Feel free to use this in any project you have.

Usage
-----

To use this software, copy the Makefile and the mddoc script to the main directory of your Ansible role. Once done, you may need to edit the Makefile.

By default, mddoc and the Makefile will parse files within role directories with the following ordering:

1. meta
1. defaults
1. vars
1. tasks
1. handlers
1. files
1. templates

So, yml files within the meta directory will be parsed first, followed by defaults, then vars, tasks, handlers, files and templates.


To run the documentation parser, simply run ```make``` at the root of your Ansible role.

---
---
