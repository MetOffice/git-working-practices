---
title: 'Feature Branch Development'
---

Cheat-sheet showcasing a workflow using feature branch development.
See the [Branching Models: Feature Branch](../episodes/02-branching.md#feature-branch)
section for more information.

## Summary Diagram

```mermaid
sequenceDiagram
    accDescr {A sequence diagram showing the steps for the branching model.}
    autonumber
    participant GHM as origin main
    participant GHF as origin feature
    participant M as main
    GHM -->> GHM: #f
    Note over GHM: Open an Issue for the change
    GHM -->> M: #f
    Note right of GHM: First time: git clone<br/>Then: git pull
    create participant F as feature
    M ->> F: Create a feature branch:<br/>git switch -c feature
    loop
        F ->> F: #f
        Note over F: Develop changes:<br/>git add<br/>git commit
    end
    F -->> GHF: #f
    Note left of F: Push to GitHub: git push<br/>The first push creates origin feature!
    destroy GHF
    GHF ->> GHM: #f
    Note left of GHF: Pull Request and then Merge.<br/>Delete origin feature branch.
    GHM -->> M: #f
    Note right of GHM: git pull
    Note over F: Delete branch:<br/>git branch -D feature
    box GitHub Remote
    participant GHM
    participant GHF
    end
    box Local
    participant M
    participant F
    end
```

## Code Example

1. Open an Issue for the change
2. Clone the repository or update your local copy

   First time only:

   ```bash
   git clone <repository-ssh-url>
   cd <repository-name>
   ```

   Then after:

   ```bash
   git switch main
   git pull
   ```

3. Create a feature branch

   ```bash
   git switch -c <branch-name>
   ```

4. Develop changes

    ```bash
    git add <files>
    git commit -m "Commit message describing the change"
    ```

5. Push to GitHub

   ```bash
   git push
   ```

6. Open a Pull Request and progress through the review process,
   merging when ready and deleting the origin feature branch.

7. Update your local copy

   ```bash
   git switch main
   git pull
   ```

8. Delete the local feature branch

   ```bash
   git branch -D <branch-name>
   ```
