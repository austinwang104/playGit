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
[ref](https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjG-u-ei_3iAhWEGqYKHX2_C6wQjhx6BAgBEAI&url=https%3A%2F%2Fens.lal.in2p3.fr%2FPresentations%2FSVN%2Fsvn.html&psig=AOvVaw1EayJnFb7JKn1O7n4LVqjZ&ust=1561292841059189)

### SVN - branch

* 分支採用snapshot **運算成本大**
* 比對程式耗時 **beyond compare** **人力成本高**
* 應用情況


![](https://github.com/austinwang104/playGit/blob/dev/img/SVN-Git-Dimensions.png?raw=true =150x100)

### SVN - Centr

# forword ...add for assume-unchanged
* 先跟大家報告一下git對於我經歷過的一些事情，之前在專案上遇到了一些情況。這些情況非常棘手。那個時候的一個案子分了兩階段在進行。
1. 第一階段deliver之後，產生了一個production的版本
2. 第二階段同時在開發，產生了一個所謂的developer的版本
3. production出現了錯誤需要立即的修復，產生了一個hotfix的版本。

* 那個時候所使用的工具是svn，那個時候大家對svn所使用到的功能大概也只用到了儲存的功能(集中管理)，對於程式碼版本的控管大概也就是一條線。
* 切分支的概念大概也就是多一個資料夾，當中的程式比對就請出了神一般的工具**beyond compare 3**
* PG們遇到的情況：
1. 核心的開發工作在`develop`的版本，`develop`會有很多新開發的功能`feature`,但是開發到一半就會被PM或使用者叫去問`production`的一個bug。然後PG們就會被中斷`developer`的開發，立刻要去修復`production`的問題產生了N個`hotfix`的內容。以SVN切Branch的狀況來說，基本上程式碼都放在不同的位置，因此這個hotfix得要透過人工的方式搬移**compoare**。
2. PG遇到兩個難題，`production`的`hotfix`要進入到`develop`，`develop`的`feature`不要進到`production`，另外一個就是要快速的切換`production`, `develop`的開發。PG每天的時間大約有50%的時間在做這些切換和`feature`&`hotfix`的搬移。

* `adding svn flow image`

### Git特點
1. 快照**snapshot**的方式記錄commit **切換快速**
    `adding picture`
2. 分散**Decentralization**的方式管理branch **分散式架構，適合隔離環境**
    `adding picture`

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
