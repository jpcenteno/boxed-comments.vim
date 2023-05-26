" ╔══════════════════════════════════════════════════════════════════════╗
" ║ Symbols                                                              ║
" ╚══════════════════════════════════════════════════════════════════════╝
"
" The purpose of this module is to provide an API for the user to set the
" symbols they want without messing up.

let s:symbols = {}

function! boxes#symbols#set(nw, n, ne, e, se, s, sw, w) abort
  let s:symbols['nw'] = a:nw
  let s:symbols['n'] = a:n
  let s:symbols['ne'] = a:ne
  let s:symbols['e'] = a:e
  let s:symbols['se'] = a:se
  let s:symbols['s'] = a:s
  let s:symbols['sw'] = a:sw
  let s:symbols['w'] = a:w
endfunction

function! boxes#symbols#get() abort
  let nw = s:symbols['nw']
  let n = s:symbols['n']
  let ne = s:symbols['ne']
  let e = s:symbols['e']
  let se = s:symbols['se']
  let s = s:symbols['s']
  let sw = s:symbols['sw']
  let w = s:symbols['w']

  return [nw, n, ne, e, se, s, sw, w]
endfunction
