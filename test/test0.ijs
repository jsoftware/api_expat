NB. parse android layout xml file
require 'api/expat'
coclass 'test'
coinsert 'jexpat'

expat_start_elementx=: smoutput@[
expat_end_elementx=: smoutput
expat_parse_xml 1!:1 < jpath '~addons/api/expat/test/test.xml'
