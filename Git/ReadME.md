# GIT
## Step 1 : Create a local git repository 
When creating a new project on your local machine using git, you'll first create a new repository
```
lesley:Desktop lesley$ cd ~/Desktop
lesley:Desktop lesley$ mkdir myproject
lesley:Desktop lesley$ cd myproject/
```
To initialize a git repository in the root of the folder, run the git init command:
```git init```
## Step 2: Add a new file to the repo
```
lesley:myproject lesley$ touch lesley.txt
lesley:myproject lesley$ ls
lesley.txt
```
After creating the new file, you can use the git status command to see which files git knows exist.
```
lesley:myproject lesley$ git status
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	lesley.txt

nothing added to commit but untracked files present (use "git add" to track)
```
What this basically says is, "Hey, we noticed you created a new file called lesley.txt, but unless you use the 'git add' command we aren't going to do anything with it."
A commit is a record of what files you have changed since the last time you made a commit. Essentially, you make changes to your repo (for example, adding a file or modifying one) and then tell git to put those files into a commit.

To add a file to a commit, you first need to add it to the staging environment. To do this, you can use the git add <filename>
Once you've used the git add command to add all the files you want to the staging environment, you can then tell git to package them into a commit using the git commit command. 
  
## Step 3: Add a file to the staging environment
Add a file to the staging environment using the git add command.
```
lesley:myproject lesley$ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   lesley.txt
```
To reiterate, the file has not yet been added to a commit, but it's about to be.

## Step 4: Create a commit

It's time to create your first commit!

Run the command git commit -m "Your message about the commit"

```
lesley:myproject lesley$ git commit -m "This is my first commit!"
[master (root-commit) b345d9a] This is my first commit!
 1 file changed, 1 insertion(+)
 create mode 100644 mnelson.txt
```
## Step 5: Create a new branch
Let's say you are on the master branch and want to create a new branch to develop your web page. Here's what you'll do: Run git checkout -b <my branch name>. This command will automatically create a new branch and then 'check you out' on it, meaning git will move you to that branch, off of the master branch.

After running the above command, you can use the git branch command to confirm that your branch was created:
```
lesley:myproject lesley$ git branch
  master
* my-new-branch
```
## Step 6: Create a new repository on (GitHub,GitLab & Gitbonobo etc.)

To create a new repo on GitHub, log in and go to the GitHub home page. You should see a green '+ New repository' button: 
When you're done filling out the information, press the 'Create repository' button to make your new repo.
```
lesley:myproject lesley$ git remote add origin https://github.com/cubeton/mynewrepository.git
lesley:myproject lesley$ git push -u origin master
Counting objects: 3, done.
Writing objects: 100% (3/3), 263 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/cubeton/mynewrepository.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
```
You'll want to change the URL in the first command line to what GitHub lists in this section since your GitHub username and repo name are different.)

## Step 7: Push a branch to (GitHub,GitLab & Gitbonobo etc.)
To push changes onto a new branch on GitHub, you'll want to run git push origin yourbranchname. GitHub will automatically create the branch for you on the remote repository: 
```
lesley:myproject lesley$ git push origin my-new-branch
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 313 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/cubeton/mynewrepository.git
 * [new branch]      my-new-branch -> my-new-branch
```
 You might be wondering what that "origin" word means in the command above. What happens is that when you clone a remote repository to your local machine, git creates an alias for you. In nearly all cases this alias is called "origin." It's essentially shorthand for the remote repository's URL. So, to push your changes to the remote repository, you could've used either the command: git push git@github.com:git/git.git yourbranchname or git push origin yourbranchname
 
 ## Step 8:  Get changes on GitHub back to your computer
 
 In order to get the most recent changes that you or others have merged on GitHub, use the git pull origin master command (when working on the master branch).
```
lesley:myproject lesley$ git pull origin master
remote: Counting objects: 1, done.
remote: Total 1 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (1/1), done.
From https://github.com/cubeton/mynewrepository
 * branch            master     -> FETCH_HEAD
   b345d9a..5381b7c  master     -> origin/master
Merge made by the 'recursive' strategy.
 lesley.txt | 1 +
 1 file changed, 1 insertion(+)
 ```
This shows you all the files that have changed and how they've changed.
Now we can use the git log command again to see all new commits.
(You may need to switch branches back to the master branch. You can do that using the git checkout master command.)

lesley:myproject lesley$ git log
commit 3e270876db0e5ffd3e9bfc5edede89b64b83812c
Merge: 4f1cb17 5381b7c
Author: Meghan Nelson <lesley@hubspot.com>
Date:   Fri Sep 11 17:48:11 2015 -0400

    Merge branch 'master' of https://github.com/cubeton/mynewrepository

commit 4f1cb1798b6e6890da797f98383e6337df577c2a
Author: Leseley  <lesley@hubspot.com>
Date:   Fri Sep 11 17:48:00 2015 -0400

    added a new file

#  Git & Github Cheatsheet

Hello Everyone !

    Today I am sharing my collection of all everyday use git commands , with usage explanations. This Sheet also contains, the methods to use online git platform like Github.

    The markdown is also available on my Github for instant reference.

Basic Commands

    Git Config :
        git config -- global user.name NAME = set user name globally
        git config --global user.email EMAIL = set user email globally
        git config user.name || git config user.email = check saved info

Creating repo

    git init = creates a git repository in the directory currently in

Staging

    git status = to check status , if staged or unstaged
    git add FILE_NAME = to add a file to staging area
    git rm --cached FILE_NAME = to remove a file from staging area
    git add . = to add all files in project to staging area

Commiting

    git commit -m "Specific Changes Made" = commits the staging area giving them a specific id

    git log = shows all the commits with details

    git log --oneline = shows all the commits in one line each

    SPECIAL log : this will log the info in a nice format (Try it once 😉)

    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit     

        this can be used as an alias
    Git Stash
        git stash = clears the changes to the initial state (last commit) & creates a unique id for the current state
        git stash apply = brings back the current state
        using git stash multiple times creates a list of stashes of all states with multiple ids
        git stash list = shows all the stash (States) with their ID
        git stash apply ID = ID will be the number , which state you want to go back to
        git stash push -m "Your message" = used to give description to stash
        git stash drop ID = used to remove a stash saved
        git stash pop ID = applies the specific stash and removes it from history
        git stash clear = removes all the stash history

Gitignore

    a .gitignore file can be created , in which you can specify all the folders/files that should not be staged and commited
    For example : node_modules/ .css.map etc.
    It's Good to create a gitignore at the start of Project
    a good gitignore generator for reference :
        Gitignore.io

Reverting & Reset

    use git log --oneline to see the commit_ID to change to
    Checkout commit :
        git checkout commit_ID = to just check the commit id entered , see it in read only ... changes will not be saved
        git checkout master = to come back to original commit (As checkout removes us from master branch)

    Revert commit :
        git revert commit_ID = to remove the changes of the provided commit (will add a new revert commit and remove the changes of the specific commit)

    Reset Commit :
        git reset commit_ID = will remove all the commits after the provided id , but the files in local directory will not be touched (therefore you can still commit to original state after doing changes as needed) ... might take you to vim editor (type ":wq" then "Enter" to exit)
        git reset commit_ID --hard = will remove all the commits after the provided id and even delete all the files and lines from local directory too

Branches

    Used to test a new feature or code , by creating a branch .. then merging it to master only if needed
    can be used for multiple developers working on same project .. create different branch for each developer adding their own feature then merging at the end
    git branch branch_name = to create a new branch
    git branch -a = to list all the branches
    git checkout branch_name = to shift to the other branch
    git branch -d branch_name = to delete the branch only when it has been merged
    git branch -D branch_name = to delete the branch (even if not merged to master)
    git checkout -b branch_name = to create and shift to a new branch at once

Merging branches

    after completing changes in a branch and commiting them

    come back to master and run

    git merge branch_name = this will merge the branch to master (all commits show in master) = automatic

    git merge --squash branch_name = this will merge the branch to master (only the commit after merge is shown in master) = manual

Conflicts

    If Branch's Base (First Commit) is Master's Head (Last Commit) = No Conflict

    If Master had commits after creating Branch = Conflicts Might Come

    to solve this , edit the files manually , Solve The Conflicts then ..

    run git add . and then git commit -m "Message" and the changes will be made

Git Rebase & Git Merge

    Using Git Merge Shows that the Branches Were Added to master , i.e the tree is not inline for all commits

    whereas Git Rebase keeps changing the base, and makes the commit inline , feels like the branch was never there

    RUN git rebase master on your branch
        Takes the base of master , matches it with every commit of your branch
        If The Master is already your base , no need of step 3, 4, 5
        solve the conflicts , then git add .
        run git rebase --continue
        Repeat 2, 3 steps for every commit - conflict
        Now The Master's Head is Branch's Base
        Move to Master
        run git rebase branch_name
        Now All the commits of Branch are added above your Master commits

    NOTE! : It is specified in the git docs that rebase should not be used in public repos (collaboration) as it can cause major errors and conflicts, it can be used in private repos.

Github

    Creating new & Cloning Repo
        create a new repo on Github and copy the URL
        now push your code to it with
        git push git_url master = pushing code of master branch (to push all branches replace master with --all)
        creating an alias to not always type URL
        git remote add origin git_url = origin can be name of anything else, but origin is the word most commonly used
        git push origin master = to push code to using alias
        git push -u origin master = pushes and starts tracking the branch (u don't need to specify it again , ex. if pulling)
        git clone git_url = will copy the repo to current directory and also add the origin alias by default
        git remote -v = to check all the aliases made
        adding id and password in push\pull :
            replacing the origin in git push origin master
            git push https://username:password@repo_url.git master
            if password contains @ replace it with %40
            NOTE : this can store your password in plain text
            to avoid this you can remove the password and enter it later
            git push https://username@repo_url.git master

    Collaborating
        Most of the collaboration features are already available on Github, Example
        git pull git_url = to pull changes from remote to local repo
        create a branch and make your changes
        git push origin branch_name = to push the specific branch to remote
        create a Compare & Pull Request when you want are ready for the branch to be merged (with a message)
        the reviewer of the repo will accept the changes and merge it (and specify a merge commit message)
        pull the project every time before editing to see the changes
        git branch -r = helps us to see the remote branches & the connections

    Forking (Contributing)
        to contribute to an open source project
        click on fork , which will copy the repo to your account
        make changes by pulling the repo, then push it ( this will happen on your account )
        then go to the owner account's repo and create a pull request there
        the owner can compare the changes and accept your changes
        which will end up merging your changes to their project
