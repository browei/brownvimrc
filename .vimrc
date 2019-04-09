set nu
set ai
set cursorline
set tabstop=8

""" Display tabs and spaces
set list 
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

""" Switch tabes
nnoremap <C-b> :tabprevious<CR>
nnoremap <C-h> :tabnext<CR>

""" Switch btw splitted windows$
nmap <silent> <A-Left> :wincmd w<CR>
nmap <silent> <A-Right> :wincmd w<CR>

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    "" add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    """ Cscope$
    "" Preprocess$
    nmap <F8> :!find . -iname '*.[ch]' > cscope.files ; cscope -b -q<CR>:cs kill -1<CR>:cs add cscope.out<CR>
    "" Usage in Vim
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    autocmd BufEnter *.c* exe 'noremap <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . && cscope -Rbkq<CR    >'
endif

