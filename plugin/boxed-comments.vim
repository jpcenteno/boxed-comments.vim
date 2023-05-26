" Maintainer:   Joaquín Centeno <https://github.com/jpcenteno>
" Version:      0.1

if exists("g:loaded_boxed_comments")
  finish
endif
let g:loaded_boxed_comments = 1

" ╔══════════════════════════════════════════════════════════════════════╗
" ║ Default config                                                       ║
" ╚══════════════════════════════════════════════════════════════════════╝

call boxes#symbols#set('╔', '═', '╗', '║', '╝', '═', '╚', '║')

" ╔══════════════════════════════════════════════════════════════════════╗
" ║ Auxiliary functions                                                  ║
" ╚══════════════════════════════════════════════════════════════════════╝

function! s:is_line_blank(lnum) abort
  let line_contents = getline(a:lnum)
  return empty(line_contents) || line_contents =~# '^\s*$'
endfunction

" ╔══════════════════════════════════════════════════════════════════════╗
" ║ Main functions                                                       ║
" ╚══════════════════════════════════════════════════════════════════════╝

function! s:append_boxed_comment() abort
  let blank_line_before = ! s:is_line_blank(line('.'))
  let blank_line_after = ! s:is_line_blank(line('.') + 1)

  let box_params = boxes#draw#box(blank_line_before, blank_line_after)
  let lines = box_params['lines']
  let post_col = box_params['col']

  let i = 0
  for line in lines
    call append(line('.') + i, line)
    let i += 1
  endfor

  let [og_bufnum, og_lnum, _, og_off] = getpos('.')
  let post_lnum = og_lnum + len(lines) / 2 + 1

  call setpos('.', [og_bufnum, post_lnum, post_col, og_off])
  startreplace
endfunction

command! -nargs=0 BoxedCommentsAppend call s:append_boxed_comment()
