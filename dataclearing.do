*Saving raw data for analysis
save "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data_raw.dta"

*Renaming and labeling variables
browse

rename authorfirstname firstname
label var firstname "Author's first name"

rename authorlastname lastname
label var lastname "Author's last name"

rename firsteditionpublisher firstedpub
label var firstedpub "First edition's publisher"

rename firsteditionpublicationplace firstedplace
label var firstedplace "First edition's publication place"

rename secondeditionpublisher secondedpub
label var secondedpub "Second edition's publisher"

rename secondeditionpublicationplace secondedplace
label var secondedplace "Second edition's publication place"

rename firsteditionpublicationyear firstedyear
label var firstedyear "First edition's publication year"

rename secondeditionpublicationyear secondedyear
label var secondedyear "Second edition's publication year"

rename additionalinfos addinfo
label var addinfo "Additional information"

label var title "Title of the book"
label var ocrresult "Text string of the OCR scan"

label var ssflag "Additional ban issued by the Reichsführer SS and the chief of the German police."
label var id "book identification number"

