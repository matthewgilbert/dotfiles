########## Variables
 
# dotfiles directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
# old dotfiles backup directory
olddir=~/dotfiles_old
# list of files/folders to symlink in homedir
files=".bashrc .vimrc .Rprofile .tmux.conf .gitconfig"  
##########
 
# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
 
# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
 
# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
echo "...done"

source ~/.bashrc
