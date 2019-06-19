git config --global alias.spull !git stash save -u "tmp" && git fetch && git pull --rebase && git stash pop && git stash list && git status && \
git config --global alias.adog !git log --all --decorate --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an %Cgreen%d %Creset%s' --graph --date='format:%y-%m-%d %H' && \
git config --global alias.tpull !git stash save -u "tmp" && git fetch && git pull --rebase -X=theirs && git stash pop && git stash list && git status && \
git config --global alias.spush !sh -c 'git add . && git commit -m \"${1-update}\" && git push' -