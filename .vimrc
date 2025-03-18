set runtimepath+=~/.vim_runtime
source ~/.vim/configs/vimrcs/basic.vim
source ~/.vim/configs/vimrcs/filetypes.vim
source ~/.vim/configs/vimrcs/extended.vim
source ~/.vim/configs/vimrcs/plugins_config.vim
try
  source ~/.vim/configs/my_configs.vim
catch
endtry

