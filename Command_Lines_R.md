# Some command lines in R

## XML

library(XML)

* doc = xmlTreeParse(fileUrl, useInternalNodes=TRUE)  (Not yet a data.frame)
* rootNode = xmlRoot(doc) (Not yet a data.frame)
* xmlName(rootNode)
* names(rootNode)    (Next node in the XML tree)
* rootNode[[1]]      (First Block Node)
* xpathSApply(rootNode, '//name', xmlValue)      (Get an item with class name)

#### REF: http://www.omegahat.org/RSXML/shortIntro.pdf

## HTML

library(XML)

* doc = htmlTreeParse(fileUrl, useInternalNodes=T)
* scores = xpathSApply(doc, '//li[@class='score]', xmlValue)
* getNodeSet(doc, '//table[@class = '']')

## JSON

library(jsonlite)

* jsonData = fromJSON(url)    (results in a data frame)
* myjson = toJSON(data, pretty = TRUE)