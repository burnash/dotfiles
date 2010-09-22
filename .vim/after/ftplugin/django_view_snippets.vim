if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag

exec "Snippet vview def ".st.et."(request):<CR>\"\"\"".st.et."\"\"\"<CR>".st.et.""
exec "Snippet rr render_to_response('".st.et."',<CR>".st.et.",<CR>context_instance=RequestContext(request)<CR>)".st.et.""
