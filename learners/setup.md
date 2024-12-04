---
title: Setup
---

## Pre-workshop Survey

Please remember to fill out the pre-workshop survey prior
to the start of the workshop.
This information is vital for us to keep improving the lesson
for other learners.

## Setup your Respository

We will be working collaboratively on the `weather` repository.
If you already have a `weather` repository from the git-novice course
then skip this section.

Create a new local repository with the name `weather`:

```bash
$ mkdir ~/Desktop/weather
$ cd ~/Desktop/weather
$ git init
```

```output
Initialised empty Git repository in ~/Desktop/weather/.git/
```

Create an empty `shipping-forecast.md` file:

```bash
$ touch shipping-forecast.md
```

Commit your changes.

```bash
$ git add shipping-forecast.md
$ git commit -m "Add a file for the shipping forecast"
```

<!-- Add link to previous lesson  -->

Create a public remote `weather` repository on GitHub and
push your local repository to the remote:

```bash
$ git remote add origin git@github.com:<your username>/weather.git
$ git push
```

The first time you push to a remote repository you will get this message:

```bash
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream main
```

You can copy and paste the suggested command.
