3 : 0''
if. UNAME-:'Linux' do.
  LIB=: 'libexpat.so.1'
elseif. UNAME-:'Android' do.
  LIB=: 'libexpat.so'
elseif. UNAME-:'Darwin' do.
  LIB=: 'libexpat.dylib'
  if. fexist t=. '/opt/local/lib/libexpat.dylib' do.
    LIB=: t
  end.
elseif. UNAME-:'Win' do.
  LIB=: 'libexpat-1.dll'
end.
)

XML_ErrorString=: (LIB, ' XML_ErrorString >', (IFWIN#' +'), ' x x')&(15!:0)
XML_GetCurrentColumnNumber=: (LIB, ' XML_GetCurrentColumnNumber >', (IFWIN#' +'), ' i x')&(15!:0)
XML_GetCurrentLineNumber=: (LIB, ' XML_GetCurrentLineNumber >', (IFWIN#' +'), ' i x')&(15!:0)
XML_GetErrorCode=: (LIB, ' XML_GetErrorCode >', (IFWIN#' +'), ' i x')&(15!:0)
XML_Parse=: (LIB, ' XML_Parse >', (IFWIN#' +'), ' i x *c i i')&(15!:0)
XML_ParserCreate=: (LIB,' XML_ParserCreate >', (IFWIN#' +'), ' x *c')&(15!:0)
XML_ParserFree=: (LIB, ' XML_ParserFree >', (IFWIN#' +'), ' n x')&(15!:0)
XML_SetCharacterDataHandler=: (LIB, ' XML_SetCharacterDataHandler >', (IFWIN#' +'), ' n x x')&(15!:0)
XML_SetElementHandler=: (LIB, ' XML_SetElementHandler >', (IFWIN#' +'), ' n x x x')&(15!:0)
XML_StopParser=: (LIB, ' XML_StopParser >', (IFWIN#' +'), ' i x i')&(15!:0)

XML_FALSE=: 0
XML_TRUE=: 1

XML_STATUS_OK=: 1
XML_STATUS_ERROR=: 0
XML_STATUS_SUSPENDED=: 2

