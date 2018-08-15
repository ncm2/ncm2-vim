"=============================================================================
" FILE: ncm2_vim.vim
" AUTHOR:  Jia Sui <jsfaint@gmail.com>
" License: MIT license
"=============================================================================

if get(s:, 'loaded', 0)
    finish
endif
let s:loaded = 1

function! ncm2_vim#on_complete(ctx) abort
  let startcol = necovim#get_complete_position(a:ctx.typed)
  let base = strpart(a:ctx.typed, startcol)
  let cnd = necovim#gather_candidates(a:ctx.typed, base)
  call ncm2#complete(a:ctx, startcol+1, cnd)
endfunction

function! ncm2_vim#init() abort
  call  ncm2#register_source({ 'name': 'vim',
        \ 'mark': 'vim',
        \ 'priority': 9,
        \ 'scope': ['vim'],
        \ 'on_complete': 'ncm2_vim#on_complete',
        \ })
endfunction
