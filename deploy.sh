cat $HOME/Dev/my-zshrc/.zshrc > ~/.zshrc
cd $HOME/Dev/my-zshrc
git add -A
opencommit -m gpt-4.1
zsh -c 'source ~/.zshrc'
git push origin main