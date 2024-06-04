install.packages("VennDiagram")
library(VennDiagram)
Semantic<-c('FHIR','DICOM®','CDISC ODM','OpenEHR','IHE','GA4GH Passports','Beacon API','Data Connect API', 'GIVD','CDISC ODM','LOINC®   ','SNOMED CT    ATC','ICD-10  PICO','ICD-11   OBI ','MIABIS','RxNorm   GO','RadLex®   ICHI','MEDCIN   NCIt','MedDRA   ICD-O','ICF OMRSE','OAE   EMDN', 'HPO ORPHA ','DCM   MESH','UMLS   UMDNS','UCUM   HGVS','DRG   DUO',  'CMO   DOID')
Syntactic<- c('FHIR','DICOM®','OMOP CDM','CDISC ODM','i2b2','OpenEHR','IHE','GA4GH Passports','Beacon API','Data Connect API','GIVD','CDA','GA4GH AAI', 'GS1 DataMatrix','GA4GH DRS','GA4GH TES')
v <- venn.diagram(list(Syntactic=Syntactic, Semantic=Semantic),
                  fill = c( "orange","light blue"),
                  alpha = c(0.3, 0.5), cat.cex = 2, cex=1,
                  filename=NULL, lty="blank",cat.just=list(c(0.7,-1) , c(0.5,-1)) )
#have a look at the default plot
grid.newpage()
grid.draw(v)
# We are interested in the labels
#lapply(v, function(i) i$label)
# Over-write labels (5 to 7 chosen by manual check of labels)
# in Semantic only
v[[5]]$label  <- paste(setdiff(Semantic, Syntactic), collapse="\n")
# in Syntactic only
v[[6]]$label <- paste(setdiff(Syntactic, Semantic)  , collapse="\n")
# intesection
v[[7]]$label <- paste(intersect(Semantic, Syntactic), collapse="\n")
# plot
grid.newpage()
grid.draw(v)
      
