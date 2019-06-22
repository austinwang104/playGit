# Git 分享 2019/06/27

## schedule
1. svn -> git   **`snapshot`, `Decentralization`**
2. tools    **`bash`, `gitlab`, `vscode`, `tortoise Git`, `SourceTree`**
3. commit   **`worktree(untracked, changed, unmerged)`, `staged files`, `commit with amend`**
4. commit-operator    **`reset`, `revert`, `cherry-pick`**
4. branch   **`tracking(remote)`, `merge`, `rebase`, `pull`, `push`**
5. Gitlab   **`issue tracking`, `branch by issue(?)`, `pull request`**
6. addition **`gitignore`, `gitattribute`, `git-hook`**
7. reference
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
    
    

2. 分散**Decentralization**的方式管理branch **分散式架構，適合隔離環境**

![](https://github.com/austinwang104/playGit/blob/dev/img/Distributed-Version-Control-System-Workflow-What-Is-Git-Edureka.png?raw=true)

# DMEO / 工具
1. bash
2. tortoise Git
3. SourceTree

# commit
1. work-tree: untrack/change-files/staging-files
    * add/remove staging-files
2. add track file
    * add/remove track
    * 可能的情形是有個個人設定檔不應該納入git控管，卻又已經上傳了。
    `sourceTree無法針對特定檔案進行管理，所以此功能僅能透過terminal進行`
3. make commit
4. manipulate commit: `revert`, `cherry-pink`
    * feature/hotfix commit to wrong branch


# branch / remote
1. push
2. pull
1. merge
    * conflict 處理
2. rebase
    * rebase --continue
3. merge **default**
4. rebase **option**


# 特殊用法
1. gitignore
    * .idea/
    * node_modules/
2. gitattribute
    * * -text
3. git-hook
    * pre-commit


#Issue Tracking **包含練習**
* 建立問題單**修改方向/範圍討論**:SA, QA, PM, USER
* 根據分支(環境)進行問題修改**保護分支(branch)**
* 修改程式碼建立認可**commit**: PG

## 練習`SA`, `PG`
1. 建立問題單**issue**
2. 針對問題單進行程式碼修改
3. 修改的程式碼放到對應的分支**branch**，然後進行程式碼審核**code review**，通過後併入，否則重新修訂。

# future work
1. ssh-keygen
2. ci/cd
3. aws/container

# reference
* [連猴子都能懂得Git入門指南](https://backlog.com/git-tutorial/tw/intro/intro2_4.html)
* [ihower的Git教室](https://ihower.tw/git/index.html)
* [git-document](https://git-scm.com/book/en/v2)
