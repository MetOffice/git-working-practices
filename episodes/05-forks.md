---
title: Forks
teaching: 30
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Create a fork of a repository.
- Contribute to the upstream repository using the fork.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- What is a fork?
- What are Issue and Pull Request templates?

::::::::::::::::::::::::::::::::::::::::::::::::::

Most open source projects require new collaborators to
contribute via their personal **fork** of the repository.
A fork is simply a copy of the repository that you make
on the server, in our GitHub, side.
This avoids having to give repository permissions to
every single collaborator.

In this episode we will create a fork and contribute
a change to the main GitHub repository using the
feature branch model we have been practising.

Your instructor will give you a link to the `git-training-demo`
repository you will be forking.
This is the **upstream** repository for you fork.

::::::::::::::::::::::::::::::::::::: instructor

To create the conflict at the end of the episode
for all learners your co-instructor should
follow along making the same changes the learners
make. The co-instructors PR should be merged
just before the learners open their PRs.
If the co-instructor has the relevant permissions
they can do this themselves while the instructor
is still teaching.

::::::::::::::::::::::::::::::::::::::::::::::::

## Open an Issue

Remember we track our work with Issues.
Open an Issue on the `git-training-demo` repository 
for adding yourself to the list of authors in the
`CITATION.cff` file.

Navigate to the **Issues** tab:

![](fig/github-fork-issue-open.png){alt='A screenshot of the git-training-demo repository showing the Issues view.'}

This repositories Issue tab looks different.
It uses [Issue templates](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository)
to provide templates for bugs and feature requests.
Click on the green **Get started** button next to the
**Feature request** option:

![](fig/github-fork-issue-1.jpeg){alt='A screenshot of the git-training-demo repository showing an Issue being opened. The template has automatically added text to the description and labelled the Issue as an enhancement.'}

You can see the Issue has text in the description already.
This is from the template which provides a consistent
structure to the Issues on this repo.
The template has also added the `enhancement` label for you.

Add in a clear title such as "Add Robert FitzRoy to the list
of authors in the CITATION file",
replace 'Robert FitzRoy' with your name.
Click **Submit new issue**.

## Create a Fork

On the repository Code tab click on the **Fork** dropdown arrow
and then the **+ Create a new fork** button:

![](fig/github-fork.png){alt='A screenshot of the git-training-demo repository showing the fork dropdown with the Create a new fork button.'}

GitHub will take you to the **Create a new fork** page.
There is no need to edit anything on this page.
Click on the green **Create fork** button:

![](fig/github-fork-2.png){alt='A screenshot of the GitHub Create a new fork page.'}

You should now see your repository fork.
The repository is marked as a fork by the fork symbol
next to the repository organisation and name in the top
navigation bar.
Under the main repository name you can see a link to the
repository we forked from.
The notification at the bottom of the screenshot shows
whether your forks `main` branch is up to date with the
upstream repository.
If you have commits on your fork not present upstream
you can **Contribute** your changes upstream via a PR.
If your fork is behind the upstream repository
you can **Sync fork** to pull in changes from the
upstream repository.

![](fig/github-fork-3.png){alt='A screenshot of a fork of the git-training-demo repository. The repository is marked as a fork by the fork symbol next to the repository name and the link to the original repository under the repository name.'}

## Make Changes

You will be using this fork to make changes using
the feature branch model from the previous episodes.
Clone your fork, replace `mo-fitzroy` with your username:

```bash
$ git clone git@github.com:mo-fitzroy/git-training-demo.git
```

```output
Cloning into 'git-training-demo'...
remote: Enumerating objects: 47, done.
remote: Counting objects: 100% (47/47), done.
remote: Compressing objects: 100% (44/44), done.
remote: Total 47 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (47/47), 17.07 KiB | 1.07 MiB/s, done.
Resolving deltas: 100% (3/3), done.
```

Create your feature branch:

```bash
$ cd git-training-demo
$ git switch -c add-citation-fitzroy
```

```output
Switched to a new branch 'add-citation-fitzroy'
```

Add your name to the `CITATION.cff` file,
underneath any existing author names:

```bash
$ nano CITATION.cff
$ cat CITATION.cff
```

```output
cff-version: 1.2.0
message: "Met Office Colleagues and Partners"
authors:
- family-names: "Theodorakis"
  given-names: "Dimitrios"
  orcid: "https://orcid.org/0000-0001-9288-1332"
- family-names: "FitzRoy"
  given-names: "Robert"
title: "Met Office Git Training Demo"
version: 2.0.4
doi: 10.4321/zenodo.1234
date-released: 2024-09-23
url: "https://github.com/MetOffice/git-training-demo"
```

Add and commit your changes:

```bash
$ git add CITATION.cff
$ git commit -m "Adds Robert Fitzroy as an author"
```
```output
[add-citation-fitzroy a3c5e13] "Adds Robert Fitzroy as an author" 
 1 file changed, 2 insertions(+)
```

Push your changes to your GitHub fork:

```bash
$ git push
```

```output
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 354 bytes | 354.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:mo-fitzroy/git-training-demo.git
   f87bb5c..a3c5e13  add-citation-fitzroy -> add-citation-fitzroy
branch 'add-citation-fitzroy' set up to track 'origin/add-citation-fitzroy'.
```

## Open a Pull Request

Head back to your fork on GitHub and open a PR to
contribute your changes upstream to the main
`git-training-demo` repository.

![](fig/github-fork-pr-open.jpeg){alt='A screenshot of a user opening a pull request from their fork back to the upstream git-training-demo repository. The description has been autofilled with the pull request template contents.'}

Notice the description has filled with a template.
Just like this repository used Issue templates it
also uses a [PR template](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository).

Check the Issue you opened earlier for the Issue number.
`mo-fitzroy` checks theirs and it was Issue `#7`.
So he changes the line `Fixes <#ISSUE_NUMBER>` to `Fixes #7`.
This will automatically close Issue 7 when the PR is merged.
We use the keyword `Fixes` here instead of the `Closes`
keyword we used before because this PR comes from a fork[^link-issue-pr].

This template has a checklist that needs to be
completed before opening the PR[^pr-checklist].
It also has checklists for science and code review.
In the description scroll down to the checklists
which look like this:

```md
- [ ] I have read `CONTRIBUTING.md` and added my name as a Code Contributor.
```

Replace the space in the square checkbox brackets with an `x`
to mark the task as complete:

```md
- [x] I have read `CONTRIBUTING.md` and added my name as a Code Contributor.
```

Now when you open the PR it should look something like this:

![](fig/github-fork-pr-1.jpeg){alt='A screenshot of a users  pull request from their fork back to the upstream git-training-demo repository.'}

This PR number `#8` will close/fix Issue number `#7` (the top left arrow).
You can request a review on the top right.
Some repositories will be set up to automatically assign
a reviewer based on how many reviews each team member
currently has open[^auto-assign-pr-review].
The middle arrow shows the checklist items we marked as complete.

At the bottom of your PR you can see that a review is required
before merging.
All checks have passed, this repository has automatic checks
for trailing whitespace, accidentally adding large files etc.
More information can be found in the optional episode on
pre-commit hooks.
It also tells us **This branch has conflicts that must be resolved** and the conflicting file is `CITATION.cff`.

Go to the main `git-training-demo` repositories code tab
and look at the contents of `CITATION.cff`:

```output
cff-version: 1.2.0
message: "Met Office Colleagues and Partners"
authors:
- family-names: "Theodorakis"
  given-names: "Dimitrios"
  orcid: "https://orcid.org/0000-0001-9288-1332"
- family-names: "Hogan"
  given-names: "Emma"
title: "Met Office Git Training Demo"
version: 2.0.4
doi: 10.4321/zenodo.1234
date-released: 2024-09-23
url: "https://github.com/MetOffice/git-training-demo"
```

Someone else has added their name
before our PR could be merged.
These changes now conflict with the one you made.
In the next episode you will learn how to deal with
conflicts.

:::::::::::::::::::::::::::::::::::::::::  spoiler

## Practicing By Yourself

If you're working through this lesson on your own,
you won't see a conflict.
You should still follow the materials through
the next episode on conflicts to learn
what to do when you do encounter a conflict.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- A fork is a server side (in our case GitHub) copy
  of the repository.
- Forks allow collaborators to contribute to the main
  repository without being given write permissions.
- Issue and Pull Request templates provide template text
  for the first comment for new Issues of various types,
  and Pull Requests.
  They can auto-label Issues and encourage collaborators
  to give plenty of detail.

::::::::::::::::::::::::::::::::::::::::::::::::::

[^link-issue-pr]: The [GitHub Documentation](https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/linking-a-pull-request-to-an-issue) has more information
on linking PRs to Issues.
[^pr-checklist]: You can also open a draft PR and then edit the top
comment to mark the checklist tasks as completed.
[^auto-assign-pr-review]: The [GitHub Documentation](https://docs.github.com/en/organizations/organizing-members-into-teams/managing-code-review-settings-for-your-team) has more information on automatically assigning reviewers.
