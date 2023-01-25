# Todo Application in Rust

This is a simple command-line todo application written in `Rust` which enables users to track day-to-day tasks.

## Docker

The rust dev environment is created using Docker container(s).

The docker image can be built using 

```bash
docker-compose build
```

The container can be started the usual way

```bash
docker-compose up -d
```

and accessed using the exec command

```bash
docker exec -it todo-app-rust sh
```

## Initialization

If there is no `todo` folder (rust app) a new Rust app can be created from within the container

```bash
cargo new todo
     Created binary (application) `todo` package
```

To run the `todo` application execute `cargo run` from within the `todo` folder, e.g.:
```bash
cd todo && cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.03s
     Running `target/debug/todo`
Hello, world!
```

# Features

## Print Usage

The todo should print the usage by default, i.e. whenever one of the accepted command-line options is not used. 
The usage output should look as the following:

```bash
$ todo

Command Line Todo application
=============================

Command line arguments:
    -l, --list            Lists all the tasks
    -a, --add <task>      Adds a new task
    -r, --remove <id>     Removes a task
    -c, --complete <id>   Completes a task
```

## List Tasks

The application should display all tasks in a list when the `-l` or `--list` options are specified

```bash
$ todo -l

 1 - [ ] Walk the dog
 2 - [x] Buy milk
 3 - [ ] Call Marc
```

## Add a new task

New tasks can be added using the `-a` or `--add` cli options. 

```bash
$ todo -a "Throw out trash"

 1 - [ ] Walk the dog
 2 - [x] Buy milk
 3 - [ ] Call Marc
 4 - [ ] Throw out trash
```

When no task details are provided the application should display an appropriate error message and print usage

```bash
$ todo -a
Unable to add: no task specified

Command Line Todo application
=============================

Command line arguments:
    -l, --list            Lists all the tasks
    -a, --add <task>      Adds a new task
    -r, --remove <id>     Removes a task
    -c, --complete <id>   Completes a task
```

## Remove a task

Tasks can be deleted using the `-r` or `--remove` options with a specified task id:

```bash
$ todo -r 3

 1 - [ ] Walk the dog
 2 - [x] Buy milk
 4 - [ ] Throw out trash
```

When an invalid id is provided the application should display an appropriate message and print usage

```bash
$ todo -r 3
Unable to remove: invalid id 

Command Line Todo application
=============================

Command line arguments:
    -l, --list            Lists all the tasks
    -a, --add <task>      Adds a new task
    -r, --remove <id>     Removes a task
    -c, --complete <id>   Completes a task
```

## Complete a task

Tasks can be marked as completed using the `-c` or `--complete` options with a specified task id:

```bash
$ todo -c 4

 1 - [ ] Walk the dog
 2 - [x] Buy milk
 4 - [x] Throw out trash
```

When an invalid id is provided the application should display an appropriate message and print usage

```bash
$ todo -c
Unable to complete: no id specified 

Command Line Todo application
=============================

Command line arguments:
    -l, --list            Lists all the tasks
    -a, --add <task>      Adds a new task
    -r, --remove <id>     Removes a task
    -c, --complete <id>   Completes a task
```

# Customization

## Storage

By default the application should in-memory storage, i.e. no persistence level.

Simple text file storage and be used instead if the `STORAGE_PATH` variable is set via an `.env` file located 
in the same directory as the todo app

```env
STORAGE_PATH=todo.dat
```

# Future

Additional cli options can be added to allow filtering of todo tasks displayed in the `-l`, `--list` options. 
For example, there should be way to display only complete/incomplete tasks, e.g. `-f=complete` or `--filter=incomplete`

Another useful option might be to implement task list pagination, e.g. `-p=1`, `--page=2` and `-ps=20`, `--page-size=10`

