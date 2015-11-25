Installation
------------

This addon requires expat binary library for working.

For Linux, expat should already be installed by default in some distros.
If not, install using (debian and its derivatives) in terminal.

$ sudo aptitude install libexpat1

For Windows, type the following in a J session to download and install
required dll from Jsoftware server.

load 'api/expat'
install_jexpat_''

Minimal documentation
---------------------

y: xml data
x: optional parameter used in derived class expat_initx
expat_parse_xml [v]    main entry point

element data
expat_characterData [n]  element data

users can define a class to override jexpat
coinsert 'jexpat'

and the derived class should override these verbs

expat_initx [v]
expat_start_elementx [v]
expat_end_elementx [v]
expat_parse_xmlx [v]

y: user's optional parameter
expat_initx [v]   call during expat_parse_xml

x: element attribute value
y: data element attribute  (pointer from expat callback)
expat_start_elementx [v]  callback from expat

y: data element (pointer from expat callback)
expat_end_elementx [v]  callback from expat

y: ''
expat_parse_xmlx [v]   call during expat_parse_xml


Example
-------

test/test0.ijs   just smoutput inside callbacks
test/test1.ijs   parse android layout resource
