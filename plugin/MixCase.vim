" File:         "MixCase.vim" 
" Last Change:  2004/06/25 15:05:54 .
" Author:       Jean-Christophe Clavier <jcclavier@free.Fr>
" Version:      0.3
" License:      GPL (http://www.gnu.org/licenses/gpl.html)
" Thanks:
"     Paul Etchell  : report the utf-8 encoding problem

" -----------------------------------------------------------------------------
" Provided functionnalities
" -----------------------------------------------------------------------------
" This plugin does nothing usefull but tries to do it well.
" it modifies words :
" - in the hackers way (mIxCAsE)
" - in the Cambridge way : it ceganhs the odrer of the lreetts which doesn't
"               afceft the raitaeidbly vrey mcuh (when the wdors are not too lnog)
" 
" Please, feel free to send me any comment. If you miss something (linked to
" m;×¢4Z3, of course), I'd add it with pleasure.
" 
" This plugin provides the following commands and functions :
" To manage ini file at runtime
"  :MCSetIniFile
"  :MCGoIniDir
"
" To Mix range of text
"  :MCCambridge
"  :MCHackerz
"
" To Mix word under cursor and, eventually substitute all occurence
"  :MCHackerzMixWordUnderCurs
"  :MCHackerzMixNSubstWordUnderCurs
"  :MCHackerzMixSearchPattern
"  :MCCambridgeMixWordUnderCurs
"  :MCCambridgeMixNSubstWordUnderCurs
"  :MCCambridgeMixSearchPattern
"
" To use in \= expressions
"  function MixCase(...)
"  function MixCambridge(...)
"
" It now uses an ini file to customize the mi×ç4$3 table the way you want.
" Eventually, you can have many ini files to swap between many types of
" MiX(ªSÊ (if you have time to loose)
" 
" No mapping is provided as you know better than me where you want to map your
" commands. Another reason is that I think mapping is for usefull commands which
" is not the case here.
" 
" -----------------------------------------------------------------------------
" Installation
" -----------------------------------------------------------------------------
" Warning : this plugin uses python
"
" This plugin is made of four files : MixCase.vim, mixcase.txt, MixCase.py and
" MixCase.ini
" MixCase.vim is to be dropped in the plugins directory, mixcase.txt in the doc
" directory and MixCase.py in a directory declared in the python path by a
" little >
" 	let $PYTHONPATH=$PYTHONPATH . "/MyDirectory/Python"
" in your .vimrc
" By default, the ini file is to be dropped in the vim directory. I must admit
" it is not a very clever choice but I didn't know where to put it. Anyway, you
" can customize this in defining g:MC_DefaultIni in your .vimrc.
" let g:MC_DefaultIni = Path/MixCase.ini
" 
" Remember that you can change the ini file at runtime with :MCSetIniFile 
" (see |MCSetIniFile|)
" 
" 
" To init the help tags, start Vim and do either
" :helptags ~/.vim/doc (for unix)
" or
" :helptags ~\vimfiles\doc (for MSWindows)
" to rebuild the tags file. Do ":help add-local-help" for more details.
"
" -----------------------------------------------------------------------------
" Encoding
" -----------------------------------------------------------------------------
" I used Latin1 encoding to define my ini files. This may cause problems if you
" use another encoding (like UTF-8).
" I haven't solved this problem yet (as I don't know how to do it automatically.
" If you have an idea...)
" Anyway, here is a way to solve the problem. In this exemple, I have the
" default ini file encoded in latin1 and I want to use UTF-8 encoding.
" 1. Open VIM and :set encoding=latin1
" 2. Open the ini file (default : MixCase.ini)
" 3. Select all and cut it
" 4. :set encoding=utf-8
" 5. Paste.
" 6. Save. You should now have an ini file utf-8 encoded.
" 
" If you use different encoding style, you can have the corresponding ini files
" and map all the different :MCSetIniFile you want.
" 
"
" -----------------------------------------------------------------------------
" Bugs :
" -----------------------------------------------------------------------------
" I tried to create commands with custom completion (command -complete=custom).
" It works well on my 6.2 vim version but it seems to cause errors on load on
" previous versions. So I commented the lines involved. If you've got a 6.2
" version, you can uncomment these lines (which are useless... even more than
" the rest of the plugin. It was just to test custom completion)
"
"
" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

" Default Mixcase Ini Table
if (!exists("g:MC_DefaultIni"))
  let g:MC_DefaultIni = $VIM."/MixCase.ini"
endif

if !exists(':MCCambridge')
    command -range=% -nargs=? MCCambridge <line1>,<line2>call s:MCCambridge(<f-args>)
endif
if !exists(':MCHackerz')
"    if version < 610
        command -range=% -nargs=? MCHackerz <line1>,<line2>call s:MCHackerz(<f-args>)
"    else
"        command -complete=custom,ListArgs -range=% -nargs=? MCHackerz <line1>,<line2>call s:MCHackerz(<f-args>)
"    endif
endif
if !exists(':MCHackerzMixWordUnderCurs')
"    if version < 610
        command -nargs=? MCHackerzMixWordUnderCurs call s:MCHackerzMixWordUnderCurs(<f-args>)
"    else
"        command -complete=custom,ListArgs -nargs=? MCHackerzMixWordUnderCurs call s:MCHackerzMixWordUnderCurs(<f-args>)
"    endif
endif
if !exists(':MCHackerzMixNSubstWordUnderCurs')
"    if version < 610
        command -nargs=? MCHackerzMixNSubstWordUnderCurs call s:MCHackerzMixNSubstWordUnderCurs(<f-args>)
"    else
"        command -complete=custom,ListArgs -nargs=? MCHackerzMixNSubstWordUnderCurs call s:MCHackerzMixNSubstWordUnderCurs(<f-args>)
"    endif
endif
if !exists(':MCHackerzMixSearchPattern')
"    if version < 610
        command -nargs=? MCHackerzMixSearchPattern call s:MCHackerzMixSearchPattern(<f-args>)
"    else
"        command -complete=custom,ListArgs -nargs=? MCHackerzMixSearchPattern call s:MCHackerzMixSearchPattern(<f-args>)
"    endif
endif
if !exists(':MCCambridgeMixWordUnderCurs')
"    if version < 610
        command -nargs=? MCCambridgeMixWordUnderCurs call s:MCHackerzMixWordUnderCurs(<f-args>)
"    else
"        command -complete=custom,ListArgs -nargs=? MCCambridgeMixWordUnderCurs call s:MCHackerzMixWordUnderCurs(<f-args>)
"    endif
endif
if !exists(':MCCambridgeMixNSubstWordUnderCurs')
"    if version < 610
        command -nargs=? MCCambridgeMixNSubstWordUnderCurs call s:MCHackerzMixNSubstWordUnderCurs(<f-args>)
"    else
"        command -complete=custom,ListArgs -nargs=? MCCambridgeMixNSubstWordUnderCurs call s:MCHackerzMixNSubstWordUnderCurs(<f-args>)
"    endif
endif
if !exists(':MCCambridgeMixSearchPattern')
"    if version < 610
        command -nargs=? MCCambridgeMixSearchPattern call s:MCHackerzMixSearchPattern(<f-args>)
"    else
"        command -complete=custom,ListArgs -nargs=? MCCambridgeMixSearchPattern call s:MCHackerzMixSearchPattern(<f-args>)
"    endif
endif
if !exists(':MCSetIniFile')
    command -complete=file -nargs=? MCSetIniFile call s:MCSetIniFile(<f-args>)
endif

if !exists(':MCGoIniDir')
    command MCGoIniDir  call s:MCGoIniDir()
endif

function! ListArgs(A,L,P)
    return "j3¥ñqBEF\njÑ3ÿß3QF\nWD®LãØr$\nWaR£ØRðZ\nCoWb0y$\nblAirEAu"
endfunction

function! s:MCGoIniDir()
    let s:cmd = "chd " . fnamemodify(g:MC_DefaultIni,":p:h")
    execute s:cmd
endfunction

function! s:MCSetIniFile(...)
    if a:0 == 1
        let g:MC_DefaultIni=fnamemodify(g:MC_DefaultIni,":p:h")."/".fnamemodify(a:1,":p:t")
    else
        MCGoIniDir
        let g:MC_DefaultIni=input("Nom du fichier : ")
    endif
endfunction

function! s:MCCambridge(...) range
    " parameters : a:1 = level
    " The text mixed is the selected range
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python curBuff = vim.current.buffer
    python a=int(vim.eval("a:firstline"))
    python b=int(vim.eval("a:lastline"))
    python iniFile=vim.eval("g:MC_DefaultIni")
    python MC=MixCase(curBuff.range(a,b),iniFile)
    if a:0 == 1
        python argmt = vim.eval("a:1")
        python modText = MC.MixCambridge(argmt)
    else
        python modText = MC.MixCambridge()
    endif
    python curBuff.range(a,b)[:] = modText
endfunction

function! s:MCHackerz(...) range
    " parameters : a:1 = level
    " The text mixed is the selected range
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python curBuff = vim.current.buffer
    python a=int(vim.eval("a:firstline"))
    python b=int(vim.eval("a:lastline"))
    python iniFile=vim.eval("g:MC_DefaultIni")
    python MC=MixCase(curBuff.range(a,b),iniFile)
    if a:0 == 1
        python argmt = vim.eval("a:1")
        python modText = MC.MixHackerz(argmt)
    else
        python modText = MC.MixHackerz()
    endif
    python curBuff.range(a,b)[:] = modText
endfunction

function! s:MCHackerzMixWordUnderCurs(...)
    " parameters : a:1 = level, a:2 = printLevel
    " The text mixed is the word under the cursor
    norm bve"mc
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python word=[vim.eval("@m")]
    python iniFile=vim.eval("g:MC_DefaultIni")
    python MC=MixCase(word,iniFile)
    if a:0 == 1
        python argmt = vim.eval("a:1")
        python modText = MC.MixHackerz(argmt)
    else
        python modText = MC.MixHackerz()
    endif
    python vim.command('let @m = "' + modText[0] + '"')
    norm "mp
endfunction

function! s:MCHackerzMixNSubstWordUnderCurs(...)
    " parameters : a:1 = level, a:2 = printLevel
    " The text mixed is the word under the cursor
    " All occurences of the word are replaced
    norm bve"my
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python word=[vim.eval("@m")]
    python iniFile=vim.eval("g:MC_DefaultIni")
    python MC=MixCase(word,iniFile)
    if a:0 == 1
        python argmt = vim.eval("a:1")
        python modText = MC.MixHackerz(argmt)
    else
        python argmt = "CoWb0yZ"
        python modText = MC.MixHackerz(argmt)
    endif
    python vim.command('let @p = "' + modText[0] + '"')
    let cmd="%s/\\<" . @m . "\\>/" . @p . "/g"
    execute cmd
endfunction

function! s:MCHackerzMixSearchPattern(...)
    " parameters : a:1 = level, a:2 = printLevel
    " The text mixed is the search pattern
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    let @m=matchstr(getline("."),@/)
    python word=[string.replace(vim.eval('@m'),"\\","\\\\")]
    python iniFile=vim.eval("g:MC_DefaultIni")
    python MC=MixCase(word,iniFile)
    if a:0 == 2
        python level = vim.eval("a:1")
        python printLevel = int(vim.eval("a:2"))
        python modText = MC.MixHackerz(level,printLevel)
    elseif a:0 == 1
        python level = vim.eval("a:1")
        python modText = MC.MixHackerz(level)
    else
        python modText = MC.MixHackerz()
    endif
    python vim.command('let @m = "' + string.replace(modText[0],"\\","\\\\") + '"')
    return @m
endfunction

function! s:MCCambridgeMixWordUnderCurs(...)
    " parameters : a:1 = level, a:2 = printLevel
    " The text mixed is the word under the cursor
    norm bve"mc
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python word=[vim.eval("@m")]
    python iniFile=vim.eval("g:MC_DefaultIni")
    python MC=MixCase(word,iniFile)
    if a:0 == 1
        python argmt = vim.eval("a:1")
        python modText = MC.MixCambridge(argmt)
    else
        python modText = MC.MixCambridge()
    endif
    python vim.command('let @m = "' + modText[0] + '"')
    norm "mp
endfunction

function! s:MCCambridgeMixNSubstWordUnderCurs(...)
    " parameters : a:1 = level, a:2 = printLevel
    " The text mixed is the word under the cursor
    " All occurences of the word are replaced
    norm bve"my
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python word=[vim.eval("@m")]
    python iniFile=vim.eval("g:MC_DefaultIni")
    python MC=MixCase(word,iniFile)
    if a:0 == 1
        python argmt = vim.eval("a:1")
        python modText = MC.MixCambridge(argmt)
    else
        python argmt = "Crgimdbae"
        python modText = MC.MixCambridge(argmt)
    endif
    python vim.command('let @p = "' + modText[0] + '"')
    let cmd="%s/\\<" . @m . "\\>/" . @p . "/g"
    execute cmd
endfunction

function! s:MCCambridgeMixSearchPattern(...)
    " parameters : a:1 = level, a:2 = printLevel
    " The text mixed is the search pattern
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    let @m=matchstr(getline("."),@/)
    python word=[string.replace(vim.eval('@m'),"\\","\\\\")]
    python iniFile=vim.eval("g:MC_DefaultIni")
    python MC=MixCase(word,iniFile)
    if a:0 == 2
        python level = vim.eval("a:1")
        python printLevel = int(vim.eval("a:2"))
        python modText = MC.MixCambridge(level,printLevel)
    elseif a:0 == 1
        python level = vim.eval("a:1")
        python modText = MC.MixCambridge(level)
    else
        python modText = MC.MixCambridge()
    endif
    python vim.command('let @m = "' + string.replace(modText[0],"\\","\\\\") + '"')
    return @m
endfunction

function! MixCase(...)
    " parameters : a:1 = level
    " The text mixed is the selected range
    if a:0 == 2
        python from MixCase import *
        python from vim import *
        python word = [vim.eval("a:2")]
        python print word
        python iniFile=vim.eval("g:MC_DefaultIni")
        python MC=MixCase(word,iniFile)
        python level = vim.eval("a:1")
        python modText = MC.MixHackerz(level,0)
        python print modText
        python vim.command('let @m = "' + string.replace(modText[0],"\\","\\\\") + '"')
        return @m
    elseif a:0 == 1
        return s:MCHackerzMixSearchPattern(a:1,0)
    else
        return s:MCHackerzMixSearchPattern(2,0)
    endif
endfunction

function! MixCambridge(...)
    if a:0 == 2
        python from MixCase import *
        python from vim import *
        python word = [vim.eval("a:2")]
        python print word
        python iniFile=vim.eval("g:MC_DefaultIni")
        python MC=MixCase(word,iniFile)
        python level = vim.eval("a:1")
        python modText = MC.MixCambridge(level,0)
        python print modText
        python vim.command('let @m = "' + string.replace(modText[0],"\\","\\\\") + '"')
        return @m
    elseif a:0 == 1
        return s:MCCambridgeMixSearchPattern(a:1,0)
    else
        return s:MCCambridgeMixSearchPattern(2,0)
    endif
endfunction

