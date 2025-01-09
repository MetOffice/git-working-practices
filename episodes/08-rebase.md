---
title: 'Rebasing'
teaching: 15
exercises: 10
---

::::::::::::::::::::::::::::::::::::::: objectives

- Rebase a feature branch to clean up its history.
- Use rebase to update a feature branch to the `HEAD` of `main`.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- When should I rebase?

::::::::::::::::::::::::::::::::::::::::::::::::::

Rebasing a branch re-writes your git history and
should be used with caution.
You might want to rebase if:

- You need to tidy up your branches history before
  performing a normal merge via a PR.
  This will help keep the history of the `main`
  branch linear.
- You need to update your branch with changes from the
  `main` branch.

## Tidying your Commit History

Consider the following scenario.
You want to add a plotting script to the
`git-training-demo` repository.
You make a branch for the feature:

```bash
$ git switch -c add_plot_script main
```

```output
Switched to branch 'add_plot_script'
```

And over the course of development you make
three commits to the file `plot_lfric.py`.
Use the commands in each tab make the same
commits to your repository:

::: tab

### Commit 1

```bash
$ nano plot_lfric.py
$ cat plot_lfric.py
```

```python
# pretnd there is code here!
```

```bash
$ git add plot_lfric.py
$ git commit -m "Adds in a Python script to plot LFRic data"
```

```output
[add_plot_script 64ac261] Adds in a Python script to plot LFRic data
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 plot_lfric.py
```

### Commit 2

```bash
$ nano plot_lfric.py
$ cat plot_lfric.py
```

```python
# pretnd there is code here!
# more Python
```

```bash
$ git commit -am "Extends the LFRic data plotting script to plot 2D fields"
```

```output
[add_plot_script 7053de7] Extends the LFRic data plotting script to plot 2D fields
 1 file changed, 1 insertion(+)
```

### Commit 3

```bash
$ nano plot_lfric.py
$ cat plot_lfric.py
```

```python
# pretend there is code here!
# more Python
```

```bash
$ git commit -am "Fixes the axis labels spelling in the LFRic data plotting script"
```

```output
[add_plot_script 0bb7871] Fixes the axis labels spelling in the LFRic data plotting script
 1 file changed, 1 insertion(+)
```

:::

Before you push to the remote and open a PR
you check your git history.
The git history now looks something like this:

```mermaid
gitGraph
    accDescr {A Git graph showing the <code>main</code> branch with the <code>add_plot_script</code> branch branching off at the first commit of <code>main</code>.}
    commit id: 'ed14d18'
    branch add_plot_script
    checkout add_plot_script
    commit id: '64ac261'
    commit id: '7053de7'
    commit id: '0bb7871'
```

We can also visualise these changes with `git log`:

```bash
$ git log --decorate --oneline --graph
```

```output
* 0bb7871 (HEAD -> add_plot_script) Fixes the axis labels spelling in the LFRic data plotting script
* 7053de7 Extends the LFRic data plotting script to plot 2D fields
* 64ac261 Adds in a Python script to plot LFRic data
* ed14d18 (origin/main) Adds Robert FitzRoy as an author (#8)
```

You realise that perhaps the spelling fix in the
third commit should have been a correction
to the first commit which added in the script.
We can use rebase to re-write our history and
combine these two commits.

::: caution

## Backup your Branch

It is a good idea to create a backup of your
feature branch just in case something
goes wrong during the rebase:

```bash
$ git branch add_plot_script.backup
```

If at anytime you want to restore the branch
from your backup switch to the backup:

```bash
$ git switch add_plot_script.backup
```

Delete the branch where rebasing was attempted:

```bash
$ git branch -D add_plot_script
```

Re-create the original branch while still
on the backup branch:

```bash
$ git switch -c add_plot_script
```

:::

We will rebase interactively using the `-i` flag.
To rebase our three commits we need to provide
the commit hash for the commit before our
three feature branch commits which is `ed14d18`
from the log above:

```bash
$ git rebase -i ed14d18
```

```output
pick 64ac261 Adds in a Python script to plot LFRic data
pick 7053de7 Extends the LFRic data plotting script to plot 2D fields
pick 0bb7871 Fixes the axis labels spelling in the LFRic data plotting script

# Rebase ed14d18..0bb7871 onto ed14d18 (3 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup [-C | -c] <commit> = like "squash" but keep only the previous
#                    commit's log message, unless -C is used, in which case
#                    keep only this commit's message; -c is same as -C but
#                    opens the editor
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .	  create a merge commit using the original merge commit's
# .	  message (or the oneline, if no original merge commit was
# .	  specified); use -c <commit> to reword the commit message
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
```

This file shows our three commits in order
from oldest to newest.
It also gives us options for each commit.
You can re-arrange commit lines to re-order
your history.

::: caution

## Aborting a Rebase

If you want to cancel the rebase at the above stage
either do nothing to the file or delete all the
commit lines.

After you save and close the file, if your rebase
has conflicts, you can abort at anytime using:

```bash
$ git rebase --abort
```

:::

We are going to drop our spelling fix and
amend our first commit to fix the spelling:

```output
edit 64ac261 Adds in a Python script to plot LFRic data
pick 7053de7 Extends the LFRic data plotting script to plot 2D fields
drop 0bb7871 Fixes the axis labels spelling in the LFRic data plotting script
```

Save and close the file.

```output
Stopped at 64ac261...  Adds in a Python script to plot LFRic data
You can amend the commit now, with

  git commit --amend 

Once you are satisfied with your changes, run

  git rebase --continue
[git-training-demo]:(add_plot_script|REBASE 1/3)$
```

The rebase has stopped at 64ac261, the commit
which added in the `plot_lfric.py` file,
because we asked to amend the commit.
We can now open up the plotting script and
make our changes.

Opening up the file now shows:

```bash
[git-training-demo]:(add_plot_script *+|REBASE 1/3)$ nano plot_lfric.py
[git-training-demo]:(add_plot_script *+|REBASE 1/3)$ cat plot_lfric.py
```

```python
# pretnd there is code here!
```

Modify and save the file so that it reads:

```python
# pretend there is code here!
```

Add the file and confirm the amendment:

```bash
[git-training-demo]:(add_plot_script *|REBASE 1/3)$ git add plot_lfric.py
[git-training-demo]:(add_plot_script +|REBASE 1/3)$ git commit --amend
```

```output
[detached HEAD 76fd423] Adds in a Python script to plot LFRic data
 Date: Mon Nov 18 10:49:25 2024 +0000
 1 file changed, 1 insertion(+)
 create mode 100644 plot_lfric.py
```

For the last few commands we have included the
full terminal prompt showing the git status
provided by the `git-prompt.sh` script
you set up in the [git-novice lesson](https://www.astropython.com/git-novice/index.html#git-autocomplete).
You can see the prompt clearly states we are
rebasing, `REBASE`, and that it is on
line `1/3` of the rebase to-do file we edited earlier.

Now we have amended the commit we can
continue with the rebase:

```bash
[git-training-demo]:(add_plot_script|REBASE 1/3)$ git rebase --continue
Auto-merging plot_lfric.py
CONFLICT (content): Merge conflict in plot_lfric.py
error: could not apply 7053de7... Extends the LFRic data plotting script to plot 2D fields
hint: Resolve all conflicts manually, mark them as resolved with
hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
hint: You can instead skip this commit: run "git rebase --skip".
hint: To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 7053de7... Extends the LFRic data plotting script to plot 2D fields
[git-training-demo]:(add_plot_script *+|REBASE 2/3)$ 
```

The rebase has tried to apply the second commit
which still has the spelling mistake
resulting in a merge error.
Open the file again and resolve the conflict:

```bash
[git-training-demo]:(add_plot_script *+|REBASE 2/3)$ nano plot_lfric.py 
[git-training-demo]:(add_plot_script *+|REBASE 2/3)$ cat plot_lfric.py 
```

```python
<<<<<<< HEAD
# pretend there is code here!
=======
# pretnd there is code here!
# more Python
>>>>>>> 3343f91
```

Modify and save the file so that it reads:

```python
# pretend there is code here!
# more Python
```

Add the file and continue with the rebase:

```bash
[git-training-demo]:(add_plot_script *+|REBASE 2/3)$ git add plot_lfric.py
[git-training-demo]:(add_plot_script +|REBASE 2/3)$ git rebase --continue
```

```output
[detached HEAD d7def6a] Extends the LFRic data plotting script to plot 2D fields
 1 file changed, 1 insertion(+)
Successfully rebased and updated refs/heads/add_plot_script.
[git-training-demo]:(add_plot_script)$ 
```

We have now successfully rebased our feature branch.
Our history shows:

```bash
$ git log --decorate --oneline --graph
```

```output
* d7def6a (HEAD -> add_plot_script) Extends the LFRic data plotting script to plot 2D fields
* e56ed99 Adds in a Python script to plot LFRic data
* ed14d18 (origin/main) Adds Robert FitzRoy as an author (#8)
```

::: callout

## detached HEAD

You may have noticed in some of the terminal
outputs above the phrase `detached HEAD`.
Remember `HEAD` simply points to the latest
commit in a branch.
You can't re-write the commit history of a
branch while you are on the branch!
`git rebase` moved you into a `detached HEAD`
space where you aren't on any branch
to perform the rebase.
When the rebase successfully completed git
re-attached `HEAD` to point to the new
most recent commit, `d7def6a` in the
output above, on the feature branch.

:::

## Updating a Branch

::::::::::::::::::::::::::::::::::::: instructor

To ensure the `main` branch of the
`git-training-demo` repository has
moved forward one commit, the co-instructor
should merge a PR making any change
they like to the repository.

Or they can make a direct edit and merge
to main by for example editing the `README.md`
file and using their branch protection
override.

::::::::::::::::::::::::::::::::::::::::::::::::

You can also use rebase to move your changes to
branch off the `HEAD` of `main`.
While we rebased our feature branch another
PR was merged with `main`:

```mermaid
gitGraph
    accDescr {A Git graph showing the <code>main</code> branch with the <code>add_plot_script</code> branch branching off at the first commit of <code>main</code>.}
    commit id: 'ed14d18'
    branch add_plot_script
    checkout add_plot_script
    commit id: 'e56ed99'
    commit id: 'd7def6a'
    checkout main
    commit id: '4rtzk8g'
```

We can use rebasing to move our feature branch
so it branches off the `HEAD` of `main`,
fixing any conflicts that arise.
This is what we are aiming for:

```mermaid
gitGraph
    accDescr {A Git graph showing the <code>main</code> branch with the <code>add_plot_script</code> branch branching off at the second commit of <code>main</code>.}
    commit id: 'ed14d18'
    commit id: '4rtzk8g'
    branch add_plot_script
    checkout add_plot_script
    commit id: 'e56ed99'
    commit id: 'd7def6a'
```

Go back to your fork on GitHub
and click on the [**Sync fork**](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork) button.
Then run `git pull` to fetch the changes:

```bash
$ git pull origin main
```

To rebase we run:

```bash
$ git rebase main
```

```output
Successfully rebased and updated refs/heads/add_plot_script.
```

That's it!
There were no merge conflicts to resolve this time.
If you are going to use rebase in this way
consider rebasing on a regular basis.

::: caution

## Merge & Rebase

Stick to one strategy if you can, or rebase before
merging.
Rebasing a branch with merge commits
is difficult to impossible.

:::

## Updating the Remote

If you are rebasing a feature branch you have
already pushed to the GitHub remote you
will need to overwrite the remote branch.

- **Always** check you have updated your local
branch from the remote **before** rebasing.
- **Always** check before pushing to the remote
after rebasing that no new commits were added
to the remote as these will be lost.

You can fetch any changes to the remote:

```bash
$ git fetch
```

And inspect the last commit with the log or `git show`
to make sure it's the commit you expect:

```bash
$ git show origin/add_plot_script
```

If the rebasing was successful and there have
been no new commits to the remote feature branch
by any collaborators it is safe to push the rebased
feature branch to the GitHub remote, overwriting
it's history.

```bash
git push --force-with-lease
```

The `--force-with-lease` flag will warn you
if there are commits on the remote branch
you would override by pushing if you forgot
to check yourself.

## Pulling a Rebased Branch

If you have rebased a feature branch
and then overwritten the remote branch
on GitHub your collaborators may need to pull
these changes to their local copies.

If the collaborator already had a copy
of your branch from before the rebase;
attempting a normal pull will result in a
lot of conflicts due to the incompatible
histories of the original and the rebased
branches.

The collaborator should
first switch to the local branch they want to
overwrite with the rebased remote version:

```bash
$ git switch add_plot_script
```

Now fetch but don't attempt to merge the
remote branch:

```bash
$ git fetch origin add_plot_script
```

Reset the local branch to match the remote origin:

```bash
$ git reset --hard origin/add_plot_script
```

Now their local branch matches the rebased
feature branch from GitHub and
everyone's branches are in sync.

:::::::::::::::::::::::::::::::::::::::  challenge

## Modifying Commit Messages

`git rebase` can also be used to modify commit messages.

Look again at the output of the interactive rebase
in this lesson.
Which keyword lets you edit the commit message?

:::::::::::::::  solution

## Solution

Edit the commit message:

```text
# r, reword <commit> = use commit, but edit the commit message
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Re-ordering Commits

In the first example removing the spelling mistake
we used the following keywords in our rebase to-do list:

```output
edit 64ac261 Adds in a Python script to plot LFRic data
pick 7053de7 Extends the LFRic data plotting script to plot 2D fields
drop 0bb7871 Fixes the axis labels spelling in the LFRic data plotting script
```

You can also re-order the lines in this file
to re-order commits.
Look at the possible rebase options again.
What other combination of keywords and/or
line-reordering would have given us the same result?

:::::::::::::::  solution

## Solution

```output
pick 64ac261 Adds in a Python script to plot LFRic data
fixup 0bb7871 Fixes the axis labels spelling in the LFRic data plotting script
pick 7053de7 Extends the LFRic data plotting script to plot 2D fields
```

This is one possibility.
We move the last commit just underneath the first
which introduced the mistake.
We use the `fixup` keyword to fix this change up
into the previous commit.

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- Rebasing helps keep your git history linear which
  can be useful when using commands such as git
  bisect to find the commit that introduced a bug.
- Rebasing re-writes your git history.
  Make a backup of your branch before rebasing.
  `git branch <branch-name>.backup`
- Use an interactive rebase with the `-i` flag
  when you want to tidy your git history.
- Use `git rebase main` to rebase your feature
  branch onto the `HEAD` of the `main` branch.
- **Always** check you have updated your local
  branch from the remote **before** rebasing.
- **Always** check before pushing to the remote
  after rebasing that no new commits were added
  to the remote as these will be lost,
  use the `--force-with-lease` flag with `git push` to help prevent this.
- Use `git push --force-with-lease` to update the
  remote branch.

::::::::::::::::::::::::::::::::::::::::::::::::::
