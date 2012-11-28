# Thor Tasks

## Description
Tasks for [thor](https://github.com/wycats/thor).

## Installation
    thor install https://raw.github.com/apsoto/thor-tasks/master/pg.thor

## Tasks

### pg:init
I like to keep my Rails apps as self-contained as possible.  This task
defaults to creating the db cluster within the Rails app's directory 
(./db/postgresql) and setting the user specified in database.yml
development environment as the super user.  You can override defaults
via options.

This allows you to have a self-contained postgresql server that will not
be littered with other databases from other Rails apps you may have.

You can then launch the server using

    postgres -D ./db/postgresql

Here is an example using a [Procfile](https://github.com/ddollar/foreman)

    db:     postgres -D ./db/postgresql

You may want to set some additional arguments (like ports) if you run
multiple postgresql servers on your system.
