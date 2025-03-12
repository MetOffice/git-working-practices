---
title: Discussion
---

## Frequently Asked Questions

1. Does Git default to origin if you run `git fetch` without origin/upstream?
    From the docs:
    When no remote is specified, by default the origin remote will be used, unless there’s an upstream branch configured for the current branch.
2. Can you rename the upstream remote?
    Yes see the [spoiler on remotes](../episodes/03-feature-branch.md#some-more-about-remotes).
    You should note that the names `origin` and `upstream` are just conventions.
    You may use any name for the remotes however it may be confusing
    for new collaborators who expect origin/upstream.
3. What do you do if you add the wrong remote link?
    Change the remote url, or remove the remote and add the remote again.
    See the [spoiler on remotes](../episodes/03-feature-branch.md#some-more-about-remotes) for the relevant Git commands.
4. How frequently should you commit changes?
    You learnt in the Introduction to Version Control with Git and GitHub
    lesson that commits should occur frequently and be atomic.
    That is contain one small change at a time.
    Committing regularly every couple of hours and pushing straight after
    committing helps avoid losing any work.
5. Can you have chains of forks? Or a colleagues fork as a remote?
    Yes to both! Although the later would be an unusual working practice,
    we'd recommend seeking advice before adding a colleagues fork
    as another remote on your local repository.
    Chains of forks are common. If a GitHub user has read access to your
    repository they can create a fork.
6. How many repositories can I have?
    "With GitHub Free for personal accounts and organizations, you can work with unlimited collaborators on unlimited public repositories with a full feature set, or unlimited private repositories with a limited feature set."
    [About repositories - GitHub Docs](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories)
