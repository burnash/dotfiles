if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet urlpatterns urlpatterns = patterns('".st.et."',<CR>".st.et."<CR>)"
exec "Snippet urlplus urlpatterns += patterns('".st.et."',<CR>".st.et."<CR>)"
exec "Snippet urli (r'^".st.et."/', include('".st.et."')),<CR>".st.et.""
exec "Snippet urlf url(r'".st.et."/$', ".st.et.", name='".st.et."'),<CR>".st.et.""
exec "Snippet urlfp url(r'".st.et."/$', ".st.et.", {".st.et."}, name='".st.et."'),<CR>".st.et.""
