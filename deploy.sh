cd $HOME/Dev/my-zshrc
git add -A
echo y | aicommits -t conventional
cat $HOME/Dev/my-zshrc/.zshrc > ~/.zshrc
zsh -c 'source ~/.zshrc'