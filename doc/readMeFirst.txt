==============================================================================
1. Intoduction ~

This plugin does nothing usefull but tries to do it well.
it modifies words :
- in the hackers way (mIxCAsE)
- in the Cambridge way : it ceganhs the odrer of the lreetts which doesn't
              afceft the raitaeidbly vrey mcuh (when the wdors are not too lnog)

It now uses an ini file to customize the mi×ç4$3 table the way you want.
Eventually, you can have many ini files to swap between many types of
MiX(ªSÊ (if you have time to loose)

No mapping is provided as you know better than me where you want to map your
commands. Another reason is that I think mapping is for usefull commands which
is not the case here.

This plugin provides the following commands and functions : ~
To Mix ranges of text :
 :MCCambridge
 :MCHackerz

To Mix word under cursor and, eventually substitute all occurence :
 :MCHackerzMixWordUnderCurs
 :MCHackerzMixNSubstWordUnderCurs
 :MCHackerzMixSearchPattern
 :MCCambridgeMixWordUnderCurs
 :MCCambridgeMixNSubstWordUnderCurs
 :MCCambridgeMixSearchPattern

To use in \= expressions :
 function MixCase(...)
 function MixCambridge(...)

To manage ini file at runtime
 :MCSetIniFile
 :MCGoIniDir

Please, feel free to send me any comment. If you miss something (linked to
m;×¢4Z3, of course), I'd add it with pleasure.

==============================================================================
2. Content of the archive ~
>
    readMe.txt              : This file
    MixCase.vim             : The plugin (-> /plugin)
    MixCase.py              : The python part of the plugin
    MixCase.ini             : The default ini file
    mixcase.txt             : The help file
    MixCaseInv.ini          : an alternate ini file
    MixCaseUTF-8.ini        : an UTF-8 encoded ini file

==============================================================================
4. Installation ~

Note : this plugin uses python

It needs four files : MixCase.vim, mixcase.txt, MixCase.py and
MixCase.ini

MixCase.vim is to be dropped in the plugins directory, mixcase.txt in the doc
directory and MixCase.py in a directory declared in the python path by a
little >
	let $PYTHONPATH=$PYTHONPATH . "/MyDirectory/Python"
in your .vimrc
By default, the ini file is to be dropped in the vim directory. I must admit
it is not a very clever choice but I didn't know where to put it. Anyway, you
can customize this in defining g:MC_DefaultIni in your .vimrc.
let g:MC_DefaultIni = Path/MixCase.ini

Remember that you can change the ini file at runtime with :MCSetIniFile 
(see |MCSetIniFile|)


To init the help tags, start Vim and do either
:helptags ~/.vim/doc (for unix)
or
:helptags ~\vimfiles\doc (for MSWindows)
to rebuild the tags file. Do ":help add-local-help" for more details.


vim:tw=78 ts=8 ft=help norl:
