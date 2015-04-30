all: whisker checkctv ctv2html sed pandoc1 sedtoc fixctv cleanup

getdumber:
	sed 's@<li class="removeme">.\+<\/li>@ @g' WebTechnologies.ctv > WebTechnologiesDumber.ctv

whisker:
	Rscript --vanilla -e 'source("whiskerit.R")'

checkctv:
	Rscript --vanilla -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com/"))); if(!require("ctv")) install.packages("ctv"); print(ctv::check_ctv_packages("WebTechnologies.ctv"))'

ctv2html:
	Rscript --vanilla -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com/"))); if(!require("ctv")) install.packages("ctv");  ctv::ctv2html("WebTechnologies.ctv", file = "WebTechnologies.html")'

sed:
	mv WebTechnologies.html doc.html
	sed 's@../packages/@http://cran.r-project.org/web/packages/@g' doc.html > doc2.html
	sed 's@<strong>@<h3>@g' doc2.html > doc3.html
	sed 's@</strong>@</h3>@g' doc3.html > doc4.html

pandoc1:
	pandoc doc4.html -o README_prep.md

sedtoc:
	sed 's@tochref@<a href@g' README_prep.md > README2.md
	sed 's@endhref@>#</a>@g' README2.md > README3.md
	sed 's@lb-@#@g' README3.md > README4.md
	sed 's@<div>@@g' README4.md > README5.md
	sed 's@</div>@@g' README5.md > README.md

fixctv:
	sed 's@[^<p><strong>].*endhref@@g' WebTechnologies.ctv > webtech1.ctv
	sed 's@>to@>@g' webtech1.ctv > WebTechnologies.ctv

pandoc2:
	pandoc README.md -o index.html

cleanup:
	rm doc.html doc2.html doc3.html doc4.html README_prep.md README2.md README3.md README4.md README5.md webtech1.ctv

json:
	xml2json < WebTechnologies.ctv > webservices.json
