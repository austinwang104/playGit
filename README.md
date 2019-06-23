# Git 分享 2019/06/27

## schedule
1. svn -> git   **`snapshot`, `Decentralization`**
2. tools    **`bash`, `gitlab`, `vscode`, `tortoise Git`, `SourceTree`**
3. commit   **`worktree(untracked, changed, unmerged)`, `staged files`, `commit with amend`**
4. commit-operator    **`reset`, `revert`, `cherry-pick`**
5. branch   **`tracking(remote)`, `merge`, `rebase`, `pull`, `push`**
6. Gitlab   **`issue tracking`, `branch by issue(?)`, `pull request`**
7. addition **`gitignore`, `gitattribute`, `git-hook`**
8. reference
    * [連猴子都能懂得Git入門指南](https://backlog.com/git-tutorial/tw/intro/intro2_4.html)
    * [ihower的Git教室](https://ihower.tw/git/index.html)
    * [git-document](https://git-scm.com/book/en/v2)


## git init/clone

### [教材Git路徑](git@github.com:austinwang104/playGit.git)
    1. http :`https://github.com/austinwang104/playGit.git`
    2. ssh : `git@github.com:austinwang104/playGit.git`

### git clone

> `git clone git@github.com:austinwang104/playGit.git aaa`
```
Cloning into 'aaa'...
Enter passphrase for key '/home/austin/.ssh/id_rsa':
remote: Enumerating objects: 139, done.
remote: Counting objects: 100% (139/139), done.
remote: Compressing objects: 100% (100/100), done.
remote: Total 365 (delta 83), reused 90 (delta 39), pack-reused 226
Receiving objects: 100% (365/365), 1.18 MiB | 608.00 KiB/s, done.
Resolving deltas: 100% (189/189), done.
```

> `git status`
```
On branch dev
Your branch is up to date with 'origin/dev'.

nothing to commit, working tree clean
```

### git init

> `git remote add origin https://github.com/austinwang104/playGit.git`
>
> `git remote -v`
```
origin  https://github.com/austinwang104/playGit.git (fetch)
origin  https://github.com/austinwang104/playGit.git (push)
```
> `git status`
```
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

## commit

### worktree(untracked, changed, unmerged)

    1.新檔案產生

    > `git status`
    ```
    Untracked files:
    (use "git add <file>..." to include in what will be committed)

            util/encrp.js
    ```

    > `git add .` **要避免大量檔案的commit，除非initial**
    > 
    > `git status`
    ```
    On branch dev
    Your branch is up to date with 'origin/dev'.

    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            new file:   util/encrp.js
    ```

* `staged files`
* `commit amend before push`
* commit 結構圖與操作

![](https://github.com/austinwang104/playGit/blob/dev/img/unstage-stage.png?raw=true)

5. additional question:    

* 如何取消設定檔的版控 **untrack**
```
git rm --cache <filename>   && git add . && git push
```

* ****



## commit-operator    
### reset
### revert
### cherry-pick


## branch   
### tracking(remote)
### merge
### rebase
### pull
### push


## Gitlab   
### issue tracking
### branch by issue(?)
### pull request


## addition 
### gitignore
### gitattribute
### git-hook


## QA

# Thanks for your time!