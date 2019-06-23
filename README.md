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
從伺服器上直接取得git branch & track

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
從本地端建立git結構後與server建立連線，並從新checkout -t 取得branch資料。

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
> `git fetch -a`
```
remote: Enumerating objects: 16, done.
remote: Counting objects: 100% (16/16), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 412 (delta 8), reused 12 (delta 4), pack-reused 396
Receiving objects: 100% (412/412), 1.19 MiB | 514.00 KiB/s, done.
Resolving deltas: 100% (220/220), done.
From hub104:austinwang104/playGit
 * [new branch]      dev        -> origin/dev
 * [new branch]      master     -> origin/master
 * [new branch]      prod       -> origin/prod
 * [new branch]      staging    -> origin/staging
 * [new tag]         ver1       -> ver1
```
> `git checkout -t origin dev`
```
Branch 'dev' set up to track remote branch 'dev' from 'origin'.
Switched to a new branch 'dev'
```
> `git status`
```
On branch dev
Your branch is up to date with 'origin/dev'.

nothing to commit, working tree clean
```

## commit

### worktree(untracked, changed, unmerged)
新檔案產生之後，git機制會追蹤新產生的檔案路徑。

> `git status`
```
Untracked files:
(use "git add <file>..." to include in what will be committed)

        util/encrp.js
```

> `git add .`
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

### git log
可以透過git commit的順序查詢log的內容 **通常會配合branch參考查詢**

> `git log --all --decorate --oneline --graph`
```
* 4c5830b 19-06-23 13 austinwang104  (HEAD -> dev, origin/dev, origin/HEAD) bcup
* 8397021 19-06-23 12 austinwang104  save temp
* 3e77dad 19-06-23 11 austinwang104  add example to git init
* 9067d72 19-06-23 11 austinwang104  test format
* 8d797a5 19-06-23 11 austinwang104  test format
* 00355b4 19-06-23 11 austinwang104  commit para style fix
* 99cd938 19-06-23 11 austinwang104  add git init sample
* f3b2f66 19-06-23 11 austinwang104  git add clone/init sample
* bd372db 19-06-23 10 austinwang104  hoho
* 007cfa6 19-06-23 10 austinwang104  hoho
* af5285e 19-06-23 08 austinwang104  change format
```

### git reflog
可以看到所有git操作的歷程
> `git reflog`
```
4c5830b (HEAD -> dev, origin/dev, origin/HEAD) HEAD@{3}: reset: moving to origin/dev
d9ddb24 HEAD@{4}: reset: moving to HEAD
d9ddb24 HEAD@{5}: reset: moving to HEAD^^^
49765c4 HEAD@{6}: reset: moving to HEAD^^^
b48aeae HEAD@{7}: reset: moving to HEAD^^^
b8369c9 HEAD@{8}: reset: moving to HEAD^^^^^^^^^^^
363d1e8 HEAD@{9}: reset: moving to HEAD^^^^^^^^^^^
53ee91c (tag: ver1) HEAD@{10}: reset: moving to HEAD^^^^^^^^^^^
```

### reset
切換到不同的commit node

> `git reset --hard HEAD`
> `get reset --hard origin/dev`
```
HEAD is now at 4c5830b bcup
```

如果要保留work-tree 可以透過--sort來保留
> `get reset --soft HEAD^`
> `git status`
```
On branch dev
Your branch is behind 'origin/dev' by 1 commit, and can be fast-forwarded.
  (use "git pull" to update your local branch)

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   README.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   README.md
```

### revert
把指定的commit做刪除之後再建立一個commit。........


### cherry-pick


## branch   
### fetch
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
### gitconfig
### gitignore
### gitattribute
### git-hook


## QA

# Thanks for your time!