---
title: 'Pre-commit'
teaching: 10
exercises: 10
---

::::::::::::::::::::::::::::::::::::::: objectives

- Explain what pre-commit hooks are.
- Install and run a pre-commit hook.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- What quality assurance checks can I run
  using pre-commit checks?

::::::::::::::::::::::::::::::::::::::::::::::::::

[Git hooks](https://git-scm.com/book/ms/v2/Customizing-Git-Git-Hooks) let you
run certain scripts before git actions.
In this optional episode we are going to
set up a [pre-commit](https://pre-commit.com/)
hook which runs quality assurance checks
on our code before we are allowed to make
a commit.

[pre-commit](https://pre-commit.com/) is a
Python package that makes it easier to
set up git hooks.
To install it using pip or conda:

::: tab

### pip

```bash
$ pip install pre-commit
```

### conda

```bash
$ conda install pre-commit
```

:::

In the `git-training-demo` we provided
an example pre-commit configuration.
These pre-commit checks were run as
part of your pull requests.
We can install the pre-commit hook scripts
so they run before we can commit locally:

```bash
[git-training-demo]:(main =)$ pre-commit install
```

```output
pre-commit installed at .git/hooks/pre-commit
```

It's good practice to run the pre-commit
checks on all your files after installing them.


```bash
[git-training-demo]:(main =)$ pre-commit run --all-files
```

```output
[INFO] Initializing environment for https://github.com/pre-commit/pre-commit-hooks.                     
[INFO] Installing environment for https://github.com/pre-commit/pre-commit-hooks.              
[INFO] Once installed this environment will be reused.                                    
[INFO] This may take a few minutes...
don't commit to branch ...................................................Passed
check for added large files ..............................................Passed
check for case conflicts .................................................Passed
check for merge conflicts ................................................Passed
check toml ...........................................(no files to check)Skipped
check yaml ...............................................................Passed
fix end of files .........................................................Passed
trim trailing whitespace .................................................Passed
```

The next time the pre-commit scripts run they will re-use
the Python environment that was just installed, making the
run faster.

The [pre-commit.com site](https://pre-commit.com/hooks.html) has a reference of useful hooks.
Your organisation may have their own pre-commit
hooks which you can use and or block third party
hooks for security.

:::::::::::::::::::::::::::::::::::::::  challenge

## Committing to Main

With the pre-commit installed try adding
any change to the `main` branch
and then run `git commit`.

What happens with the pre-commit hooks installed?

:::::::::::::::  solution

## Solution

The pre-commit check for not committing to main
fails so `git commit` wasn't run.
Your changes are still staged.

```bash
[git-training-demo]:(main +=)$ git commit -m "Attempts to commit to main"
```

```output
don't commit to branch...................................................Failed
- hook id: no-commit-to-branch
- exit code: 1
check for added large files..............................................Passed
check for case conflicts.................................................Passed
check for merge conflicts................................................Passed
check toml...........................................(no files to check)Skipped
check yaml...............................................................Passed
fix end of files.........................................................Passed
trim trailing whitespace.................................................Passed
```

To move the staged changes to a new branch
use `git switch`:

```bash
[git-training-demo]:(main +=)$ git switch -c <branch-name>
```

```output
Switched to a new branch 'challenge'
```

```bash
[git-training-demo]:(challenge +)$ git status
```

```output
On branch challenge
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   .pre-commit-config.yaml
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- pre-commit checks help prevent accidental commits
  to `main` and provide an extra layer of
  quality assurance.

::::::::::::::::::::::::::::::::::::::::::::::::::