NB. concatenate node data
NB. should check buffer overflow issue in the future
expat_char_data=: 3 : 0
'data s len'=. y
expat_characterData=: expat_characterData, memr s,0,len,2
EMPTY
)

subst2=: (_2<\'\"\\\/\b\f\n\r\t')&(i.{(34 92 47 8 12 10 13 9{&.><a.),])"0
hexchars=. 'ABCDEF0123456789abcdef'
dfh=: 16 #. 16 | _6 + hexchars i. ]
subst6=: (8 u:[:u:@dfh 2}.]) ::]^:(6&=@#*.('\'={.)*.'uU'e.~{.@}.)&.>

splitbs=: (0;(0 10#:10*".;._2]0 :0);(a.e.hexchars)+(2*a.='\')+3*a.e.'Uu')&;:
 1.1  1.1  2.1 1.1
 1.0  1.0  2.2 1.0
 3.0  3.0  3.0 4.0
 1.2  1.2  2.2 1.2
 1.2  5.0  2.2 1.2
 1.2  6.0  2.2 1.2
 1.2  7.0  2.2 1.2
 1.2  3.0  2.2 1.2
)
evalbs=: [:; [:subst2 [:subst6 splitbs^:(*@#)

NB. =========================================================
NB. download and install expat dll for windows
install=: 3 : 0
if. -. IFWIN do. return. end.
require 'pacman'
for_lib. <;._1 ' libexpat-1.dll' do.
  'rc p'=. httpget_jpacman_ 'http://www.jsoftware.com/download/', z=. 'winlib/',(IF64{::'x86';'x64'),'/',,>lib
  if. rc do.
    smoutput 'unable to download: ',z return.
  end.
  (<jpath'~bin/',>lib) 1!:2~ 1!:1 <p
  1!:55 ::0: <p
end.
smoutput 'done'
EMPTY
)

