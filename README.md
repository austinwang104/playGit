# playGit



# forword
* 先跟大家報告一下git對於我經歷過的一些事情，之前在專案上遇到了一些情況。這些情況非常棘手。那個時候的一個案子分了兩階段在進行。
1. 第一階段deliver之後，產生了一個production的版本
2. 第二階段同時在開發，產生了一個所謂的developer的版本
3. production出現了錯誤需要立即的修復，產生了一個hotfix的版本。

* 那個時候所使用的工具是svn，那個時候大家對svn所使用到的功能大概也只用到了儲存的功能(集中管理)，對於程式碼版本的控管大概也就是一條線。
* 切分支的概念大概也就是多一個資料夾，當中的程式比對就請出了神一般的工具**beyond compare 3**
* PG們遇到的情況：
1. 核心的開發工作在`develop`的版本，`develop`會有很多新開發的功能`feature`,但是開發到一半就會被PM或使用者叫去問`production`的一個bug。然後PG們就會被中斷`developer`的開發，立刻要去修復`production`的問題產生了N個`hotfix`的內容。以SVN切Branch的狀況來說，基本上程式碼都放在不同的位置，因此這個hotfix得要透過人工的方式搬移**compoare**。
2. PG遇到兩個難題，`production`的`hotfix`要進入到`develop`，`develop`的`feature`不要進到`production`，另外一個就是要快速的切換`production`, `develop`的開發。PG每天的時間大約有50%的時間在做這些切換和`feature`&`hotfix`的搬移。


# 特點
1. 差異的方式記錄commit **切換快速**
2. 分散的方式管理branch **隔離環境**

# commit
1. work-tree: untrack/change-files/staging-files
2. add track file
2. make commit

# branch


# 特殊用法
1. gitignore
2. gitattribute
3. git-hook


#Issue Tracking **包含練習**
* 建立問題單**修改方向/範圍討論**:SA, QA, PM, USER
* 根據分支(環境)進行問題修改**保護分支(branch)**
* 修改程式碼建立認可**commit**: PG

## 練習
1. 建立問題單**issue**
2. 針對問題單進行程式碼修改

# reference
* [連猴子都能懂得Git入門指南](https://backlog.com/git-tutorial/tw/intro/intro2_4.html)
* [ihower的Git教室](https://ihower.tw/git/index.html)
* [git-document](https://git-scm.com/book/en/v2)