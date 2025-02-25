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

#### Checking Access

As a collaborator you will be able to edit files on GitHub.

1. Go to the GitHub repository.
2. Scroll down to the top of the rendered README.
3. In the top right corner of the README click on the **Edit file** pencil icon.

If you aren't a collaborator you will see the message:

> Sorry, you're not able to edit this repository directly

If you are a collaborator, GitHub's online editor will appear.

### Organisational Repositories

Repositories in organisations have more levels of permissions[^permission-org].
Team members require at least **write** access to use the branching model.
For all lower levels of access use the forking model.

[^permission-org]: The [GitHub Documentation](https://docs.github.com/en/organizations/managing-user-access-to-your-organizations-repositories/managing-repository-roles/repository-roles-for-an-organization) has more information on the 
different permission levels for repositories in organisations.

#### Checking Access

::: group-tab

### Read

If you can see the repository on GitHub you have read access (or higher).

If you click on a link to a repository and get GitHub's 404
not found page:

1. Check if you have SSO (Single Sign On) to the relevant organisation.
2. Ask the repository admins for read access.

### Triage

If you can add labels and assign yourself to Issues and PRs
you have triage access (or higher).

### Write

With write access you will be able to edit files on GitHub.

1. Go to the GitHub repository.
2. Scroll down to the top of the rendered README.
3. In the top right corner of the README click on the **Edit file** pencil icon.

If you don't have write access this message is displayed in a banner:

> You're making changes in a project you don't have write access to.

If you have write access (or higher), GitHub's online editor will appear.

### Maintain and Admin

If you have Maintain or Admin privileges you can edit the repositories settings.
Navigate to the top right **Settings** tab from the repository homepage.

See the GitHub documentation[^permission-org] for the differences between Maintainers and Admins.

:::

:::::::::::::::::::::::::::::::::::::::: keypoints

- On a repository you own or are an admin on navigate to
  [`https://github.com/<organisation>/<repository>/settings/access`](https://github.com/<organisation>/<repository>/settings/access)
  to control access for collaborators.
- You can give individuals or teams access to a repository.

::::::::::::::::::::::::::::::::::::::::::::::::::
