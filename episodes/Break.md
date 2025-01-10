---
title: Break
teaching: 0
exercises: 0
---

You've now used the Feature Branch model to:

1. Open an Issue describing the feature or bug
2. Clone a repository
3. Create a branch to develop your changes on
4. Make changes to your working copy
5. Open a Pull Request
6. Respond to review
7. Update your local copy and tidy up your branches

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

Take a break - get up and move about.
