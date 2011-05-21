" Full run with erb
command! -nargs=1 -range T call s:ExtractTranslation(function('s:WrapInErb'), <q-args>)
" Bare text (just text)
"command! -nargs=1 -range Tj call s:ExtractTranslationBareText(<q-args>)
" Quoted text (kwoated;)
command! -nargs=1 -range Tk call s:ExtractTranslation(function('s:WrapInUnderscore'), <q-args>)

function! s:WrapInErb(msgid)
  return "<%=_('".a:msgid."')%>"
endfunction

function! s:WrapInUnderscore(msgid)
  return "_('".a:msgid."')"
endfunction

function! s:ExtractTranslation(WrapperFunc, msgid)
  " yank current visual selection to reg x
  normal gv"xy
  " put new string value in reg x
  let msgstr = @x
  " Strip whitespaces and quotes
  let msgstr = substitute(msgstr, '^\([''"]\|\s\)\+', "", "")
  let msgstr = substitute(msgstr, '\([''"]\|\s\)\+$', "", "")
  " Remove newlines - to be done
   
  let replacement = call(a:WrapperFunc, [a:msgid])
  call s:AppendTranslation(a:msgid, msgstr)
  let @x = replacement

  " re-select area and delete
  normal gvd
  " paste new string 
  normal "xP
endfunction
 
function! s:AppendTranslation(msgid, msgstr)
  let filename = g:po_file
  " open file
  let fl = readfile(filename)
  " Add comment string
  call add(fl, "")
  call add(fl, "#: ".bufname("%").":".line("."))
  " Add rest
  call add(fl, 'msgid "'.a:msgid.'"')
  call add(fl, 'msgstr "'.a:msgstr.'"')
  call writefile(fl, filename)
endfunction
