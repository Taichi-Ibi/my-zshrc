cd $HOME/Dev/my-zshrc
git add -A
opencommit -y
cat $HOME/Dev/my-zshrc/.zshrc > ~/.zshrc
exec zsh
