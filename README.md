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

## using SVN

### SVN 操作流程
![](https://github.com/austinwang104/playGit/blob/dev/img/workflow-1.png?raw=true)
[from](https://walty8.com/comparison-of-git-and-svn/)

### SVN - branch

* 分支採用snapshot **運算成本大**
* 比對程式耗時 **beyond compare** **人力成本高**
* 應用情況

![](https://github.com/austinwang104/playGit/blob/dev/img/2019-06-22_225951.png?raw=true)

### SVN - Centralized

* 公司程式庫 / 客戶端程式庫 **封閉環境**
* 離開SVN後無法作業 **無法加班**
* 程式碼錯誤影響作業 **個別排除**
* 應用情況

![](https://github.com/austinwang104/playGit/blob/dev/img/Centralized-Version-Control-System-Workflow-What-Is-Git-Edureka.png?raw=true)


### Git特點
1. 快照**snapshot**的方式記錄commit **切換快速**
    
![](https://github.com/austinwang104/playGit/blob/dev/img/rYPpv.png?raw=true)

2. 分散**Decentralization**的方式管理branch **分散式架構，適合隔離環境**

![](https://github.com/austinwang104/playGit/blob/dev/img/Distributed-Version-Control-System-Workflow-What-Is-Git-Edureka.png?raw=true)


## git init/clone
* [教材Git路徑](git@github.com:austinwang104/playGit.git)
    1. http :`https://github.com/austinwang104/playGit.git`
    2. ssh : `git@github.com:austinwang104/playGit.git`

> git clone git@github.com:austinwang104/playGit.git
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


> git status

```
On branch dev
Your branch is up to date with 'origin/dev'.

nothing to commit, working tree clean
```


## commit
1. `worktree(untracked, changed, unmerged)`
2. `staged files`
3. `commit amend before push`
4. commit 結構圖與操作

![](https://github.com/austinwang104/playGit/blob/dev/img/unstage-stage.png?raw=true)

5. additional question:    

* 如何取消設定檔的版控 **untrack**
```
git rm --cache <filename>   && git add . && git push
```

* ****



## commit-operator    
1. `reset`
2. `revert`
3. `cherry-pick`


## branch   
1. `tracking(remote)`
2. `merge`
3. `rebase`
4. `pull`
5. `push`


## Gitlab   
1. `issue tracking`
2. `branch by issue(?)`
3. `pull request`


## addition 
1. `gitignore`
2. `gitattribute`
3. `git-hook`


## QA

# Thanks for your time!