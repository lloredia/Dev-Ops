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

