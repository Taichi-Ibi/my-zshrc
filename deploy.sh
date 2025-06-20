cat $HOME/Dev/my-zshrc/.zshrc > ~/.zshrc
sleep 1
cd $HOME/Dev/my-zshrc
git add -A
opencommit -y
zsh -c 'source ~/.zshrc'
