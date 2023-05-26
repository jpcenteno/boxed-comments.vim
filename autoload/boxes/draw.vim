" ╔══════════════════════════════════════════════════════════════════════╗
" ║ Draw                                                                 ║
" ╚══════════════════════════════════════════════════════════════════════╝
"
" Consider the following box:
"
" /* ╔════════╗ */
" /* ║ {TEXT} ║ */
" /* ╚════════╝ */
"
" It could be dissected as:
"
" ```
" {comment_l}{nw}{top_bar}{ne}{comment_r}
" {comment_l}{w}{middle_space}{e}{comment_r}
" {comment_l}{sw}{bottom_bar}{se}{comment_r}
" ```
"
"
"

function! s:comment_surroundings() abort
  return split(substitute(substitute(substitute(
        \ &commentstring, '^$', '%s', ''), '\S\zs%s',' %s', '') ,'%s\ze\S', '%s ', ''), '%s', 1)
endfunction

function! s:format_box_line(cl, l, m, r, cr) abort
  let len = &textwidth - len(a:cl) - len(a:cr) - len(a:l) - len(a:r)
  return a:cl . a:l . repeat(a:m, len) . a:r . a:cr
endfunction

function! boxes#draw#box() abort
  let [comment_l, comment_r] = s:comment_surroundings()
  let [nw, n, ne, e, se, s, sw, w] = boxes#symbols#get()
  
  let lines = [
  \ s:format_box_line(comment_l, nw, n, ne, comment_r),
  \ s:format_box_line(comment_l, w, ' ', e, comment_r),
  \ s:format_box_line(comment_l, sw, s, se, comment_r),
  \ ]

  let col = len(comment_l) + len(w) + 2

  return {'lines': lines, 'col': col}
endfunction
