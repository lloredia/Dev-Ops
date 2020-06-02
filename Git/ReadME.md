# GIT
* Step 1 : Create a local git repository 
When creating a new project on your local machine using git, you'll first create a new repository
```
lesley:Desktop lesley$ cd ~/Desktop
lesley:Desktop lesley$ mkdir myproject
lesley:Desktop lesley$ cd myproject/
```
To initialize a git repository in the root of the folder, run the git init command:
```git init```
* Step 2: Add a new file to the repo
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
  
  * Step 3: Add a file to the staging environment
