" foldcol: Fold Column function
" Author:	Charles E. Campbell, Jr.
" Date:		Dec 21, 2004
" Version:	2
" Usage:
" 	Using visual-block mode, select a block (use ctrl-v).  Press \fc
" 	This operation will fold the selected block away.
" 	Using normal mode, press \fc.  This operation will remove all
" 	FoldCol-generated inline-folds.
"
if !hasmapto("<Plug>VFoldCol","v")
 vmap <unique> <Leader>fc <Plug>VFoldCol
endif
vmap <silent> <Plug>VFoldCol	:<c-u>call <SID>FoldCol(1)<cr>

if !hasmapto("<Plug>NFoldCol","n")
 nmap <unique> <Leader>fc <Plug>NFoldCol
endif
nmap <silent> <Plug>NFoldCol	:call <SID>FoldCol(0)<cr>

" ---------------------------------------------------------------------
"  FoldCol: use visual block mode (ctrl-v) to select a block to fold
fun! <SID>FoldCol(dofold)
"  call Dfunc("FoldCold(dofold=".a:dofold.")")
  if a:dofold
   " make a new fold
   if &conc == 0
	let &conc= 1
   endif

   " upper left corner
   let line_ul = line("'<") - 1
   let col_ul  = virtcol("'<")  - 1

   " lower right corner
   let line_lr = line("'>")
   let col_lr  = virtcol("'>")
  
"   call Decho('syn region FoldCol start="\%>'.line_ul.'l\%>'.col_ul.'v" end="\%>'.line_lr.'l\|\%>'.col_lr.'v" conceal')
   exe 'syn region FoldCol start="\%>'.line_ul.'l\%>'.col_ul.'v" end="\%>'.line_lr.'l\|\%>'.col_lr.'v" conceal'
  else
   " remove all folded columns
   syn clear FoldCol
  endif
"  call Dret("FoldCold")
endfun
" vim: ts=4
