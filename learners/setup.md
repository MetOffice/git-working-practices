---
title: Setup
---

## Pre-workshop Survey

Please remember to fill out the pre-workshop survey prior
to the start of the workshop.
This information is vital for us to keep improving the lesson
for other learners.

## SSH Check

Run:

```bash
$ ssh -T git@github.com
```

If you **DO NOT** see the output:

```output
Hi <username>! You've successfully authenticated, but GitHub does not provide shell access.
```

Please go back to the [introduction lesson's SSH setup instructions](https://metoffice.github.io/git-novice/#ssh-setup).

## Single sign-on (SSO) Check

If you are part of an organisation that requires single
sign-on (SSO) to access their GitHub organisation you
will need to authorise the SSH key for use in the organisation.

Next to the SSH key in the [GitHub settings](https://github.com/settings/keys)
click on "Configure SSO".
Find the organisation in the list and click on "Authorise".
If the key is already authorised, it will say "Deauthorise" instead,
and nothing more needs to be done.

Full instructions on SSH key setup and SSO authorisation
can be found in the [introduction lesson's SSH setup instructions](https://metoffice.github.io/git-novice/#ssh-setup).

## Give Your GitHub Username to the Instructors

In this lesson you will be working on a new repository,
called `git-training-demo`, which your instructors have set up for you.
If you are working through this material as part of a workshop
your instructors will ask you to provide them with your
GitHub username, no other setup is required.

::: caution

### Failure to provide your GitHub username

If you do not provide your GitHub username to your instructors
**before** the workshop your registration will be removed.

:::

If you are working through this material in your own time
you will need to be provided with repository permissions for Episodes 1-5.
Met Office colleagues should request membership to the
[`git-and-github-training` GitHub team](https://github.com/orgs/MetOffice/teams/git-and-github-training).
Met Office partners should email the
[Science Git Migration Project](mailto:ScienceGitMigrationProjectSupport@metoffice.gov.uk) with the subject: **GH WP Training Permissions Request**,
please include your GitHub username in the email.
Please be patient when you arrive at Episode 5 Review
as you will need to wait for an instructor to review your changes.
