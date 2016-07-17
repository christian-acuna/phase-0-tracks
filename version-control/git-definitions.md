# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

  Version control is a system used by software developers to manage the changes to files in a project. It is useful for helping developers and software teams manage changes to a codebase over time. It also servers as a backup mechanism that allows developers to inspect any part of the code during the lifecycle of the project.

* What is a branch and why would you use one?

  A branch is a way to make an edit or change to a project in a nondestructive way. A branch is a exact copy of the master branch that allows you to make edits without affecting the main codebase. You would make a branch to add a feature or fix a bug then merger it into the master branch.

* What is a commit? What makes a good commit message?

A commit is a snapshot of your current project at that moment in time. It is analogous to a save and it allows developers to go back in time to that point if something went wrong or if they want to inspect the project at a certain point in time. A good commit message is in the present tense and succinctly describes the changes to the project.

* What is a merge conflict?

When you are working on a branch and want to combine your changes into the another branch (usually the master), a merge conflict might occur. In most cases, Git makes merging easy and figures out how to resolve conflicts. However, when two people make changes to the exact same lines in a file, or if one person deletes a line while another person modifies the line, Git will flag these files as having a merge conflict. A merge conflict must be resolved before continuing to work. 
