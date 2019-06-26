# Git 分享 2019/06/27 ...

## schedule
1. svn -> git   **`snapshot`, `Decentralization`**
2. tools    **`bash`, `gitlab`, `vscode`, `tortoise Git`, `SourceTree`**
3. commit   **`worktree(untracked, changed, unmerged)`, `staged files`, `commit with amend`**
4. commit-operator    **`reset`, `revert`, `cherry-pick`**
5. branch   **`tracking(remote)`, `merge`, `rebase`, `pull`, `push`**
6. Gitlab   **`issue tracking`, `branch by issue(?)`, `pull request`**
7. addition **`gitconfig`, `gitignore`, `gitattributes`, `git-hook`**
8. reference
    * [連猴子都能懂得Git入門指南](https://backlog.com/git-tutorial/tw/intro/intro2_4.html)
    * [ihower的Git教室](https://ihower.tw/git/index.html)
    * [git-document](https://git-scm.com/book/en/v2)
    * [ATLASSIAN](https://www.atlassian.com/cs/git/tutorials/learn-git-with-bitbucket-cloud)


## using SVN

### SVN 操作流程
![](https://github.com/austinwang104/playGit/blob/dev/img/workflow-1.png?raw=true)
[from](https://walty8.com/comparison-of-git-and-svn/)

### SVN - branch

![](https://github.com/austinwang104/playGit/blob/dev/img/2019-06-22_225951.png?raw=true)

* 分支採用snapshot **運算成本大**
* 比對程式耗時 **beyond compare** **人力成本高**

### SVN - Centralized

![](https://github.com/austinwang104/playGit/blob/dev/img/Centralized-Version-Control-System-Workflow-What-Is-Git-Edureka.png?raw=true)

* 公司程式庫 / 客戶端程式庫 **封閉環境**
* 離開SVN後無法作業 **無法加班**
* 程式碼錯誤影響作業 **個別排除**


### Git特點

#### 快照**snapshot**的方式記錄commit **切換快速**
    
![](https://github.com/austinwang104/playGit/blob/dev/img/rYPpv.png?raw=true)

#### 分散**Decentralization**的方式管理branch **分散式架構，適合隔離環境**

![](https://github.com/austinwang104/playGit/blob/dev/img/Distributed-Version-Control-System-Workflow-What-Is-Git-Edureka.png?raw=true)


## git init/clone

### [練習的Git路徑](git@github.com:austinwang104/playGit.git)
    1. http :`https://github.com/austinwang104/playGit.git`
    2. ssh : `git@github.com:austinwang104/playGit.git`
* 隨後會移入**ehrms2_SA/3.7.技術分享紀錄/**

* **TOOL**: 建議以`bash`為主，另外課程當中會介紹`**Gitlab**`, `vsCode`, `TORTOISE GIT`, ~~`SOURCETREE`~~, ~~`webstorm`~~ 的使用方式

![](https://github.com/austinwang104/playGit/blob/dev/img/cheetsheet.png?raw=true)

* 如果使用`bash`的話，應該會想要採用透過ssh的方式認證。

    **因為如果透過https認證的話，每次認證需要輸入帳密。`正常的心理反應是會很惱人`**

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

* commit 結構

![](https://github.com/austinwang104/playGit/blob/dev/img/18333fig0301-tn.png?raw=true)

* commit 檔案區塊與功能對應

![](https://github.com/austinwang104/playGit/blob/dev/img/unstage-stage.png?raw=true)

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

#### `staged files`
> `git reset -- <files>`
```
透過reset可以把指定的檔案給設定為HEAD
```
> `git reset origin/master -- <files>`
```
可以透過指定的branch/commit 取回檔案
```
#### `commit amend before push`
> `git commit -m 'commitMessage'`

* push 之前 可以做的事情

> `git commit --amend`
```
git會開啟預設的editor
自由編輯後可以進行存檔
存檔後，commit內容即更新
```

### 情境：如何取消設定檔的版控 **untrack**
```
git rm --cache <filename>   && git add . && git push
```
> 結果：上述的做法是連同設定檔都會被排除git控管之外**消失在伺服器repository當中**

**如果只是想排除控管的話，可以透過`--assume-unchanged`, `skip-worktree`來達成**
```
git update-index --assume-unchanged <file>
git update-index --skip-worktree <file>
```
> 注意：但是在Server的repository如果有更新的時候，會出現因衝突無法下載的情況，則需要列舉**
```
git ls-files -sv | grep ^H -v
```
> 注意：找到真正受影響的檔案之後，再反向操作即可    **tortoiseGit -> **
```
git update-index --no-assume-changed
git update-index --no-skip-worktree
```


## commit-operator    

### git log

可以透過`git commit`的順序查詢log的內容**通常會配合branch參考查詢**

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
可以看到所有`git操作歷程`
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
切換到不同的`commit node`

* 可自行排除錯誤的`commit`

![](https://github.com/austinwang104/playGit/blob/dev/img/capture_stepup6_3_1.png?raw=true)

> `git reset --hard HEAD`
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

    把指定的commit做刪除之後再建立一個commit。

![](https://github.com/austinwang104/playGit/blob/dev/img/git-revert.png?raw=true)
> `git revert e1a9f6b`
```
[dev c622b94] Revert "wait to revert"
 1 file changed, 1 insertion(+), 1 deletion(-)
```
> `git status`
```
On branch dev
Your branch is ahead of 'origin/dev' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```

### cherry-pick
從挑選出一個commit，直接加到現在操作的branch當中。
![](https://github.com/austinwang104/playGit/blob/dev/img/git-cherry-pick.png?raw=true)

> `git cherry-pick`
```
error: could not apply e1a9f6b... wait to revert
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: and commit the result with 'git commit'
```
> `git status`
```
On branch dev
Your branch is up to date with 'origin/dev'.

You are currently cherry-picking commit e1a9f6b.
  (fix conflicts and run "git cherry-pick --continue")
  (use "git cherry-pick --abort" to cancel the cherry-pick operation)

Unmerged paths:
  (use "git add <file>..." to mark resolution)

        both modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
```
> `git ls-files -sv | grep README`
```
M 100644 a70511105cc0b1bdc228cd793f2accdc0a17bcda 1     README.md
M 100644 2e8bae6e7e744237acb33ab5cd41caa167ddf4de 2     README.md
M 100644 85ab9da3b242f00099700a52b7097da585676414 3     README.md
```
> `git status`
```
On branch dev
Your branch is up to date with 'origin/dev'.

nothing to commit, working tree clean
```
> `git ls-files -sv | grep README`
```
H 100644 2e8bae6e7e744237acb33ab5cd41caa167ddf4de 0     README.md
```


## branch   
![](https://github.com/austinwang104/playGit/blob/dev/img/Branch-2.png?raw=true)
### fetch => **git pull = git fetch + git merge**

取回server上的branch結構，才能知道server上限在分支上的變動，才能針對新的分支結構進行操作。

> `git fetch -a`
```
~~error: cannot lock ref 'refs/remotes/origin/dev': ref refs/remotes/origin/dev is at 5d30e169ec3896b037dad388245963e53516c688 but expected 8792dae416d151ef3dc40d0ec63a134c1aaaaeb5~~
From hub104:austinwang104/playGit
 ! 8792dae..5d30e16  dev        -> origin/dev  (unable to update local ref)
```

### tracking(remote)
> `git branch -u origin/dev`
```
Branch 'dev' set up to track remote branch 'dev' from 'origin'.
```

### merge
> `git merge <branch>`

![](https://github.com/austinwang104/playGit/blob/dev/img/Branch-1.png?raw=true)
### rebase

> `git checkout experiment`
> `git rebase master` 
> First, rewinding head to replay your work on top of it...
> Applying: added staged command

![](https://github.com/austinwang104/playGit/blob/dev/img/rebase-branch-18333fig0329-tn.png?raw=true)

> `git rebase <branch>`

* merge運作得很好，為什麼需要rebase?
![](https://github.com/austinwang104/playGit/blob/dev/img/merge_commits.png?raw=true)

* 如果上面的圖感覺還蠻好看的話，可以參考這張
![](https://github.com/austinwang104/playGit/blob/dev/img/1_6jovdG5QkLEPNEj3ScbM2g.png?raw=true)

* rebase 運作概念圖
![](https://github.com/austinwang104/playGit/blob/dev/img/git-rebase.png?raw=true)

### pull
> `git pull`
> `git pull -u origin dev`

* pull 其實是一種merge **預設動作**
* 可以透過rebase的方式進行pull
> `git pull --rebase`   **可以避免無謂的merge，但是有機會遇到大量的衝突`conflicts`**

* rebase or not
![](https://github.com/austinwang104/playGit/blob/dev/img/mergerebase.png?raw=true)

### push
* 針對track的branch進行分支推送
> `git push`
* branch如果沒有預設的track branch，可以指定或修改 track的branch
> `git push -u origin dev`
* 可以修改本地端對應遠端的branch **可以設定為不同名稱的branch，但是習慣會使用相同的branch命名。另外在新版的git有提供config進行branch對應的預設`simple`**
> `git push -u origin dev:dev`

* 另外可以強制修正server的branch  **此動作可以完全改掉server上的branch內容，通常在git管理介面上會加上保護`protect`**
> `git push -f`


## Gitlab    

* issue tracking
* branch by issue(?)
* pull request **code review**


## addition 
* gitconfig   **alias**
```
[alias]
    spull = !git stash save -u "spull" && git fetch && git pull --rebase -X=theirs && git stash pop && git stash list && git status
    adog = !git log --all --decorate --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an %Cgreen%d %Creset%s' --graph --date=short
    tpull = !git stash save -u "tmp" && git fetch && git pull --rebase -X=theirs && git stash pop && git stash list && git status
    spush = !sh -c 'git add . && git commit -m \"${1-update}\" && git push' -
```
* gitignore   **ignore setting files**
```
~$*
node_modules/
```
* gitattributes  **-text**
```
* -text
[core]
    autocrlf = true
```
* git-hook  **pre-commit**
```
ehco hello-world
```
* git 版號
> `git rev-parse --short dev`
```
905ba45
```
> `git rev-list --count --all dev`
```
174
```

## QA

### Thanks for your time!
