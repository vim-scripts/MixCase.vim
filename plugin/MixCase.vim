" File:         "MixCase.vim" Last modification : 2003/10/21 13:58:13 .
" Author:       Jean-Christophe Clavier
" Version:      0.1
"
" This plugin is absolutely useless.
" it modifies words :
" - in the hackers way (mIxCAsE)
" - in the Cambridge way in cginnahg the odrer of the lreetts which doesn't
"               afceft the raitaeidbly vrey mcuh (when the wdors are not too lnog)
"
" provided commands are :
" :MCCambridge  which can work on a range of lines (the default is to mix the
"               whole text)
"               this function accepts one parameter that can have two values :
"               "Crgimdbae" (or 0) et "Cabdgimre" (or 1).
"               level 0 (Crgimdbae) : letters are mixed randomly (except the
"                   first and the last). This is the default.
"               level 1 (Cabdgimre) : letters are sorted in alphabetic order
"                   (except the first and the last).
"               This mode has been developped because
"               ariccondg to a sdtuy of the Cmrgdbiae uetsvnriiy, lreetts
"               oredr in a wrod is not iaoprtmnt. The only thing taht is
"               iatomrpnt is that the fsrit and the lsat are in a good
"               poiitosn. Otrhes can be in a toatl dersiodr, you can sltil
"               raed wuiohtt any ploberm. It is bscauee hamun brian deosn't
"               raed each leettr but the word as a wlohe
"               Note that this may be an hoax. I have not verified but i found
"               it funny to make a function of it : when the words are short
"               enough, it is true that the text is readable.
"
" :MCHackerz    can also work on a range of lines. This function accepts one
"               parameter which can take 6 values : "ROokIE" (or 0), "CoWb0yZ" (or
"               1), "WaR£ØRðZ" (or 2), "WD®LãØr$" (or 3), "jÑ3ÿß3QF" (or 4) or
"               "j3¥ñqBEF" (or 5)
"               level 0 (ROokIE), only the letters case is modified.
"                   This mode is to be used only by MixcasE ROokIeS
"               level 1 (CoWb0yZ), Some letters are changed by digits. Nothing
"                   bad but may be useful for m1Xc4z3 COdING.
"               level 2 (WaR£ØRðZ), it is the mode of m|XCÅZE WaRlo®ÐZ.
"                   Transformed text begins to look a little more punchy. It
"                   is the default mode.
"               level 3 (WD®LãØr$). The level is getting higher : before the
"                   classical :MCHackerz, the "Cambridge" mix is applied.
"                   To be used by mi×c4se W4rL¤RÐz a little dyslexic
"                   Text is still almost readable, even for normal people.
"               level 4 (jÑ3ÿß3QF). here begins the MixCase for high level
"                   mI×(4se Wa®£¤rDz : before the classical MixCase, a rot13
"                   is applied. It is advised to be fluent with rot13 reading
"                   before using this option. You must pay attention to the
"                   fact that, oppositely to the normal rot13, this result is
"                   not reversible.
"               level 5 (j3¥ñqBEF). The total mix. Before the classical
"                   Mixcase, a "Cambridge" Mix and a rot13 are applied. It is
"                   then |ñÐISp3ñZ@ßLE to completly master the rot13 reading
"                   before using :MCHackerz j3¥ñqBEF. To be used only by
"                   hªRD¢õ®3 mI×cÅ$e Wª®LørD§
"
" :MCMixWordUnderCurs    applies MCHackerz to the word under the cursor (with
"                   the same parameters)
" :MCMixNSubstWordUnderCurs   applies MCHackerz to the word under the cursor
"                   (with the same parameters) and subtitute the result to all
"                   occurs of this word in the text (very interesting for
"                   M;x(ªz3 Wªr£øRÐs coding)
"                   The default value for the parameter is "CoWb0yZ"
"
" :MCMixSearchPattern   applies MCHackerz to the content of the last search
"                   register (@/) result is written in the "m" register.
" MixCase(a)        is a funtion that return the result of MCHackerz
"                   applied to the matchstring of a regular expression.
"                   It can be invoked in a command like
"                   :%s/RegExp/\=MixCase(level)
"                   The default level is "WaR£ØRðZ"
"
" Installation
" Warning : this plugin uses python
"
" It is made of two files : MixCase.vim and MixCase.py.
" MixCase.vim is to be dropped in the plugins directory and MixCase.py
" in a directory declared in the python path by a little
" let $PYTHONPATH=$PYTHONPATH . "/MyDirectory/Python"
" in your .vimrc
"
" Bugs :
" I tried to create commands with custom completion (command -complete=custom).
" It works well on my 6.2 vim version but it seems to cause errors on load on
" previous versions. So I commented the lines involved. If you've got a 6.2
" version, you can uncomment these lines (which are useless... even more than
" the rest of the plugin. It was just to test custom completion)
"
" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim


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
if !exists(':MCMixWordUnderCurs')
"    if version < 610
        command -nargs=? MCMixWordUnderCurs call s:MCMixWordUnderCurs(<f-args>)
"    else
"        command -complete=custom,ListArgs -nargs=? MCMixWordUnderCurs call s:MCMixWordUnderCurs(<f-args>)
"    endif
endif
if !exists(':MCMixNSubstWordUnderCurs')
"    if version < 610
        command -nargs=? MCMixNSubstWordUnderCurs call s:MCMixNSubstWordUnderCurs(<f-args>)
"    else
"        command -complete=custom,ListArgs -nargs=? MCMixNSubstWordUnderCurs call s:MCMixNSubstWordUnderCurs(<f-args>)
"    endif
endif
if !exists(':MCMixSearchPattern')
"    if version < 610
        command -nargs=? MCMixSearchPattern call s:MCMixSearchPattern(<f-args>)
"    else
"        command -complete=custom,ListArgs -nargs=? MCMixSearchPattern call s:MCMixSearchPattern(<f-args>)
"    endif
endif

function ListArgs(A,L,P)
    return "j3¥ñqBEF\njÑ3ÿß3QF\nWD®LãØr$\nWaR£ØRðZ\nCoWb0y$\nblAirEAu"
endfunction

function! s:MCCambridge(...) range
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python curBuff = vim.current.buffer
    python a=int(vim.eval("a:firstline"))
    python b=int(vim.eval("a:lastline"))
    python MC=MixCase(curBuff.range(a,b))
    if a:0 == 1
        python argmt = vim.eval("a:1")
        python modText = MC.MixCambridge(argmt)
    else
        python modText = MC.MixCambridge()
    endif
    python curBuff.range(a,b)[:] = modText
endfunction

function! s:MCHackerz(...) range
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python curBuff = vim.current.buffer
    python a=int(vim.eval("a:firstline"))
    python b=int(vim.eval("a:lastline"))
    python MC=MixCase(curBuff.range(a,b))
    if a:0 == 1
        python argmt = vim.eval("a:1")
        python modText = MC.MixHackerz(argmt)
    else
        python modText = MC.MixHackerz()
    endif
    python curBuff.range(a,b)[:] = modText
endfunction

function! s:MCMixWordUnderCurs(...)
    norm bve"mc
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python word=[vim.eval("@m")]
    python MC=MixCase(word)
    if a:0 == 1
        python argmt = vim.eval("a:1")
        python modText = MC.MixHackerz(argmt)
    else
        python modText = MC.MixHackerz()
    endif
    python vim.command('let @m = "' + modText[0] + '"')
    norm "mp
endfunction

function! s:MCMixNSubstWordUnderCurs(...)
    norm bve"my
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    python word=[vim.eval("@m")]
    python MC=MixCase(word)
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

function! s:MCMixSearchPattern(...)
    python import vim, string, random
    python from MixCase import *
    python from vim import *
    let @m=matchstr(getline("."),@/)
    python word=[string.replace(vim.eval('@m'),"\\","\\\\")]
    python MC=MixCase(word)
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

function! MixCase(...)
    if a:0 == 1
        return s:MCMixSearchPattern(a:1,0)
    else
        return s:MCMixSearchPattern(2,0)
    endif
endfunction

