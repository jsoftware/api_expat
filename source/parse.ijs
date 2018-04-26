NB. derived class should override these verbs
expat_initx=: 0:
expat_start_elementx=: 0:
expat_end_elementx=: 0:
expat_parse_xmlx=: 3 : ' 0;'''';'''' '

NB. main entry point
NB. y: xml data
NB. x: optional parameter used in derived class
expat_parse_xml=: 3 : 0
'' expat_parse_xml y
:
expat_init x
parser=. XML_ParserCreate <<0
f=. [: 15!:13 (IFWIN#'+') , ' x' $~ +:@>:
XML_SetElementHandler parser, (f 3), (f 2)
XML_SetCharacterDataHandler parser, (f 4)

if. XML_STATUS_ERROR = XML_Parse parser; y; (PARLEN=: #y); XML_TRUE do.
  err=. memr 0 _1 2,~ XML_ErrorString XML_GetErrorCode parser
  lncol=. (XML_GetCurrentLineNumber parser), XML_GetCurrentColumnNumber parser
  XML_ParserFree parser
  _1;err;lncol return.
end.

XML_ParserFree parser
expat_parse_xmlx''
)

NB. house keeping
NB. y optional parameter used in derived class
expat_init=: 3 : 0
expat_characterData=: ''
expat_initx y
EMPTY
)

NB. libexpat callbacks

expat_start_element=: 3 : 0
'data element attribute'=. y
expat_characterData=: ''
elm=. evalbs memr 0 _1 2,~ element
att=. val=. 0$<''
i=. 0
while. pa1=. {.memr 0 1 4,~ attribute+SZI*i do.
  pa2=. {.memr 0 1 4,~ attribute+SZI*i+1
  att=. att, <evalbs memr 0 _1 2,~ pa1
  val=. val, <evalbs memr 0 _1 2,~ pa2
  i=. 2+i
end.
y expat_start_elementx~ elm;att;<val
EMPTY
)

expat_end_element=: 3 : 0
'data element'=. y
expat_characterData=: evalbs dltb (LF,' ',TAB,' ') charsub expat_characterData
expat_end_elementx y
expat_characterData=: ''
EMPTY
)

NB. callback in current locale
cdcallback=: 3 : 0
y=. 15!:17''
if. 3=#y do. expat_start_element y
elseif. 2=#y do. expat_end_element y
elseif. 4=#y do. expat_char_data 3{.y
end.
)

