zsh -c 'source ~/.zshrc'
cat $HOME/Dev/my-zshrc/.zshrc > ~/.zshrc
cd $HOME/Dev/my-zshrc
git add -A
opencommit -y
