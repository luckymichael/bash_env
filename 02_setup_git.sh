##########################################################
####################### set up git #######################
##########################################################
git config --global user.name "Michael Ou"
git config --global user.email "ougengxin@gmail.com"
git config --global apply.whitespace nowarn

#git config --global alias.co checkout
if [[ $OSTYPE == darwin* ]]; then
  git config --global credential.helper osxkeychain
elif [[ $OSTYPE == cygwin* ]]; then
  git config --global credential.helper cache
elif [[ $OSTYPE == linux* ]]; then
  git config --global credential.helper cache
fi




if [ -f ~/.gitconfig ]; then
  echo '[color]' >> ~/.gitconfig
  echo 'found ~/.gitconfig'
else
  echo '[color]' >  ~/.gitconfig
fi

echo '    branch = auto' >> ~/.gitconfig
echo '    diff = auto' >> ~/.gitconfig
echo '    status = auto' >> ~/.gitconfig
echo '[color "branch"]' >> ~/.gitconfig
echo '    current = yellow reverse' >> ~/.gitconfig
echo '    local = yellow' >> ~/.gitconfig
echo '    remote = green' >> ~/.gitconfig
echo '[color "diff"]' >> ~/.gitconfig
echo '    meta = yellow bold' >> ~/.gitconfig
echo '    frag = magenta bold' >> ~/.gitconfig
echo '    old = red bold' >> ~/.gitconfig
echo '    new = green bold' >> ~/.gitconfig
echo '[color "status"]' >> ~/.gitconfig
echo '    added = yellow' >> ~/.gitconfig
echo '    changed = green' >> ~/.gitconfig
echo '    untracked = cyan' >> ~/.gitconfig


echo '.DS_Store' > ~/.gitexcludes
