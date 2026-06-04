---
title: 'Quick Start Repository Guide'
---

Creating a new repository is not difficult, but does not happen frequently.
Normally you will be contributing to a repository that has already been
created on GitHub.

There are two main ways of creating a new repository:
[GitHub-first](./repo-quick-start.md#github-first),
or [local-first](./repo-quick-start.md#local-first).
They are only slightly different,
so which method you use is largely down to preference,
but the focus here is on GitHub-first as overall it is simpler.

## GitHub First

This way you will create the GitHub repository first.
Then you will clone the repository to get a local copy.
Cloning and working in this way is covered in the
[Git & GitHub Working Practices](https://www.astropython.com/git-working-practices/) lesson.

### Create the remote on GitHub

To create a new repository on GitHub:

1. Under the "+" menu in the top-right corner of any GitHub page, click [New repository](https://github.com/new)
2. Choose an appropriate owner, name, and visibility
    - Private: only you
    - Internal (organisations only): read permissions to anyone in the organisation
    - Public: read permissions to anyone
3. Tick the box to initialise with a README file (unless [creating a local repository](./repo-quick-start.md#local-first) first)

### Clone the GitHub remote

```bash
$ git clone git@github.com:<organisation>/<repository>.git
$ cd <repository>
```

## Local First

If you already have files you wish to version control
this approach is best:

1. Change into the directory containing files you want to version control
2. Initialise the directory as a git repository

```bash
$ git init
```

3. Make an initial commit, where "Repository Name" is replaced with a suitable name for the repository

```bash
$ echo "# Repository Name" > README.md
$ git add README.md
$ git commit -m "Initial commit"
```

4. Check if you are on the `main` branch with `git status` or your terminal prompt
   if you have [Git Autocomplete](./setup.md#git-autocomplete) setup.
   Rename the default branch from `master` to `main`
   (master is considered outdated terminology) if your current branch is `master`.

```bash
$ git branch -M master main
```

5. Create a [new GitHub repository](https://github.com/new) with no files.
5. Set up links to the new GitHub repository

```bash
git remote add origin git@github.com:<organisation>/<repository>.git
git push
```

Adapted from the work of Violet Sherratt (Met Office).
