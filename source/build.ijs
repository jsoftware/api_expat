NB. build.ijs

mkdir_j_ jpath '~Addons/api/expat'
mkdir_j_ jpath '~addons/api/expat'
mkdir_j_ jpath '~Addons/api/expat/test'
mkdir_j_ jpath '~addons/api/expat/test'

writesourcex_jp_ '~Addons/api/expat/source';'~Addons/api/expat/expat.ijs'

(jpath '~addons/api/expat/expat.ijs') (fcopynew ::0:) jpath '~Addons/api/expat/expat.ijs'

f=. 3 : 0
(jpath '~Addons/api/expat/',y) fcopynew jpath '~Addons/api/expat/source/',y
(jpath '~addons/api/expat/',y) (fcopynew ::0:) jpath '~Addons/api/expat/source/',y
)

f 'manifest.ijs'
f 'history.txt'
f 'readme.txt'
f 'test/test.xml'
f 'test/test0.ijs'
f 'test/test1.ijs'
