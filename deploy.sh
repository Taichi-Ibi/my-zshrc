git add -A
opencommit -y
cat $HOME/Dev/my-zshrc/.zshrc > ~/.zshrc
cd $HOME/Dev/my-zshrc
exec zsh
