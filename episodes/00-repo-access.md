---
title: Repository Access
teaching: 10
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Know how to give a collaborator access to your repository.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- What levels of repository permissions are there?

::::::::::::::::::::::::::::::::::::::::::::::::::

To be able to contribute to the `git-training-demo`
repository your instructors will have to give you access.
They are going to showcase this now.
The steps are:

In the repository page on GitHub, click the "Settings"
button on the right, select "Collaborators",
click "Add people", and enter a username/s.

![A screenshot of the GitHub Collaborators settings page for a public personal repository, which is accessed by clicking "Settings" then "Collaborators".](fig/github-add-collaborators.png){alt='A screenshot of the GitHub Collaborators settings page, which is accessed by clicking "Settings" then "Collaborators".'}

To accept access to the repository, you will
need to go to [https://github.com/notifications](https://github.com/notifications)
or check for an email notification.
Once there you can accept access to the repository.

## Permission Levels

### Personal Repositories

Repositories on personal accounts only have
two levels of permissions, the Owner and Collaborators[^permission-personal].
To use the branching model in this lesson you would need
adding as a collaborator.
You can still contribute to a public repository without being added
as a collaborator by using the forking model.

[^permission-personal]: The [GitHub documentation](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-user-account-settings/permission-levels-for-a-personal-account-repository) has more information on
permissions for a repository on a personal account.

### Organisational Repositories

Repositories in organisations have more levels of permissions[^permission-org].
Team members require at least **write** access to use the branching model.
For all lower levels of access use the forking model.

[^permission-org]: The [GitHub Documentation](https://docs.github.com/en/organizations/managing-user-access-to-your-organizations-repositories/managing-repository-roles/repository-roles-for-an-organization) has more information on the 
different permission levels for repositories in organisations.

:::::::::::::::::::::::::::::::::::::::: keypoints

- On a repository you own or are an admin on navigate to
  [`https://github.com/<organisation>/<repository>/settings/access`](https://github.com/<organisation>/<repository>/settings/access)
  to control access for collaborators.
- You can give individuals or teams access to a repository.

::::::::::::::::::::::::::::::::::::::::::::::::::
