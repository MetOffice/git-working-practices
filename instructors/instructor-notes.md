---
title: Instructor Notes
---

## General Notes

General notes for each section are below:

### [Setup](../learners/setup.md)

Below are setup steps instructors need to complete before
the workshop.

#### GitHub Usernames

You should collect GitHub usernames from learners
beforehand either using the sign-up form or
by emailing learners separately the week before.
Sort the learners into pairs before the workshop.
They need to be in pairs to review each others PRs
in [Episode 5 Review](../episodes/04-review.md).

In [Episode 1](../episodes/00-repo-access.md) you will demonstrate
how to give access to a repository by adding these users
to the `git-training-demo` repository.
If there are many external learners from partner institutions
you may wish to give some learners **write** access to the `git-training-demo`
repository before the lesson to save time.

### `git-training-demo` Repository

::: callout

## Met Office

Met Office instructors will find that the `git-training-demo`
repository has already been set up for you.
If for any reason you need to create a new repository
you can do so by creating a new repository
from the  `git-training-demo-template` template repository
(you will still need to setup the rule in step 8 below),
or by following all the steps below.

:::

To setup the repository for this lesson you will need
to create the `git-training-demo` repository using the
[zipped directory](data/git-training-demo.zip) we provide.

1. Download the [zipped directory](data/git-training-demo.zip).
2. Unzip the directory on your system.
3. Edit the `CITATION.cff` file so the
GitHub repository url is correct for
your organisation.
4. Initialise the git repository locally.
5. Add all files and commit.
6. Create an empty GitHub repo with the
   name `git-training-demo`.
7. Link your local repo to the remote and
   push all changes.
8. Setup a rule to require a PR before
   merging with `main`.
   Allow admins to bypass this rule.

The last step is to create a new milestone on the repository
with the name: **Git & GitHub WP INSERT_DATE**.

### GitHub Project

::: callout

## Met Office

Met Office instructors will find that the **Git & GitHub WP** Project
has already been setup for them.
Instructors just need to ensure that all learners
are either in the `git-and-github-training` Met Office GitHub team
or have been given read access if they are external to the organisation.

:::

You will need to create a GitHub Project for learners to
link Issues they create on the `git-training-demo` repository to.
You can name this Project **Git & GitHub WP**.
Give the `git-and-github-training` team permissions on the GitHub Project.

### [Introduction](../index.md)

Use the following text as a guide for your intro,
show the web notes as you introducing the workshop.

How do you use Git and GitHub to collaborate?
This course will guide learners through two common workflows
used to collaborate on code with GitHub.
It will introduce you to all sorts of neat features like
GitHub projects for team management and automatic code review testing.
By the end of the workshop you'll have the knowledge you
need to decide which working practices are right for you
and your team.
Some things we'll be thinking about:

- Who do I need to give repo access to? How do I do it?
- How do you do a full code review on GitHub?
- What do all the merge options mean?
- Do we merge main (trunk) into our feature branches?
- Who presses the merge button?

At the start of the lesson take some time to:

While you are waiting for everyone post the pre-lesson survey form in the chat.
If they haven't done this they must now.

- Introduce the instructors and the helpers
- Describe what it means to be an instructor and a helper, and how they will interact with each other and the learners during the training.
  This should be agreed by the instructor and the helper before the training.
  For example, some instructors are more than happy for a helper to jump in if they have something useful to share
  / if they have forgotten something. The learners should be told about this,
  so that it doesn't appear to the learners that the helper is interrupting.
- Outline a rough schedule (there is a rough schedule in the instructor view setup page)
  Or simply state that the morning focuses on Git and the afternoon on GitHub
- Remember to take regular breaks
- What are the outcomes of the lesson? They are on the Setup page!
- How to navigate the material.
  Where are the git and fcm to git cheatsheets?
  Learners can do the challenges or the read the Discussion section if they are ahead.
- We understand a large amount of the information in this course will likely be new to most of you,
  so we encourage you to ask questions at any time.
  Remember, there is no such thing as a stupid question!
  (remember to let learners know how you want them to ask Qs
  in-person learners can raise their hands or use green/red sticky notes,
  online learners can raise their hand)
- How to get help with anything related to Git and GitHub after the training (surgeries and support mailbox)
- Mention about the feedback form and that any feedback will be used to improve the training
- Ensure the material can be read by learners in the room (to change the font size in firefox use View --> Zoom --> Zoom In or <ctrl><+>)
- Ensure learners can hear you well

### [Repository Access](../episodes/00-repo-access.md)

At the start of this episode you will demonstrate how to give
collaborators access to the `git-training-demo` repository.
Give **write** access to:

- The `git-and-github-training` team (which will include all Met Office colleagues).
- Add partners individually.

Later on in the workshop before the episode on forking
you will reduce learners permissions to **triage**.

### [Issues](../episodes/01-issues.md)

This section is relatively simple - open an Issue to
add a file with your favourite cloud.

- Add a milestone, project, and assign yourself to the Issue.
- It would be good to have an image of a cloud to
  drag and drop in the Issue to demonstrate this functionality.

### [Branching Models](../episodes/02-branching.md)

There is nothing in this episode for learners to do
so keep it short and snappy.

- Highlight that in the intro lesson learners used the feature branch workflow.
- Mention the links at the end of the episode which have much
more detail on other models.

### [Feature Branch Model](../episodes/03-feature-branch.md)

Learners will not have cloned a repository before!
PR templates and automatically closing PRs are also new.
**When the PR is opened they should assign the other learner
in their pair as the reviewer**.

There is a chance their changes fail the PR checks.
Point out that they may have failed, show the PR page
and see if any have red cross next to them.
Explain briefly that we use automated PR checks
using pre-commit and there is an [optional episode](../episodes/09-pre-commit.md)
at the end of the lesson on how to use these.
You may need to help learners fix their change locally
and push a new commit so these checks pass.
If you take a 10 minute or longer break at the end of
the episode you can help those learners whose tests failed during the break.

### [Review](../episodes/04-review.md)

It's important that learners make a suggestion on their partners PR,
it doesn't matter what that suggestion is.

The 2 instructors will need to swap part way through this episode.

#### Reviewing Changes

In this section the first instructor should review the PR
opened by the second instructor.

#### Responding to Review

In this section the second instructor should respond to the review,
sharing their screen.
They can change their GitHub theme so that the 2 instructors GitHub pages
look visually distinct, this makes it clearer whether we are
watching the reviewer or the developer.

#### Approving Changes

Swap back to the first instructor so they can approve the changes.
Make sure you cover the content in the
**WHO PRESSES THE MERGE BUTTON?** callout.
Give learners a break and the opportunity to complete
the yellow challenge **Local Cleanup**.

### [Break](../episodes/Break.md)

Remember to take regular breaks.

### [History](../episodes/07-history.md)

Users will have covered using `git log` in the intro lesson.
Show learners what the history of the repository looks like now.
Then walk through the merge options, keep it short and snappy.
There are no learner exercises in this episode,
make sure you ask learners what questions they have at the end.

### [Forks](../episodes/05-forks.md)

You can choose here to either change everyone's permissions down
to **triage**:

- during the break before the episode.
- at the start of the episode to remind learners again how to change permissions.

Please showcase fully, as described in the episode,
how to sync your fork via the command line.
They will use the handy GitHub button later.

### [Conflicts](../episodes/06-conflict.md)

The most important thing to remember here is the second instructor
**MUST** have opened a PR just like the learners are doing
and merge this after opening (and after learners have updated their `main`
branches and created their feature branches).
They can bypass protections and do this while the first instructor is teaching.
This generates the citation file conflict the first instructor will point out.

### [End](../episodes/End.md)

What questions do the learners still have?
If there is time then maybe with a vote decide what to briefly look at:

- Actions
- pre-commit
- Rebasing

## Notes from within Episodes

The following notes are stored within the episode webpages
and are extracted here for completeness:
