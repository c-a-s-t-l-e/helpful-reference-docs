# Gitting Git: A Basic Git Workflow for Teams

## 1. Copy the repo locally

```
git clone <repository-url>
```
This clones the repository to your local machine.

## 2. Create a branch

```
git checkout -b <new-branch-name>
```
This creates a new branch and switches to it.

## 3. Make changes
After making changes to the files, you need to stage and commit them:

```
git add .
git commit -m "Description of the changes made"
git add . stages all changes, and git commit commits them with a message.
```

## 4. Push the branch and create a pull request
Push the changes to the remote repository:

```
git push origin <new-branch-name>
```
Once your branch is pushed, go to your repository's hosting service (GitHub, GitLab, etc.) and create a pull request (PR) from the new branch against the main branch. This step is typically done on the platform’s web interface.

## 5. Address review comments
If there are review comments, make the necessary fixes in your local branch:

```
# Make the necessary changes
git add .
git commit --amend -m "Updated based on review comments"  # Or create a new commit
# Push the changes again
git push --force-with-lease
```

If you amended the previous commit, use --force-with-lease to force-push the changes. If you created a new commit instead, you can simply do a normal push.

## 6. Merge your pull request
Once your pull request is approved, you can merge it either via the web interface or using the command line:

```
git checkout main  # Switch to the main branch
git pull origin main  # Ensure your main branch is up to date
git merge <new-branch-name>
```

If you're using the web interface, typically there's a "Merge" button to finalize the PR.

## 7. Delete your branch
Once the pull request is merged, you can delete the branch both locally and remotely:

```
git branch -d <new-branch-name>  # Delete the local branch
git push origin --delete <new-branch-name>  # Delete the remote branch
```
