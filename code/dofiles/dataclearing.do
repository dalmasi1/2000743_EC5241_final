clear

cd C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final

use "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data\data_raw.dta"

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

*Correcting data quality issues: changing the types of variables
recast long pagenumberinocrdocument

*Formatting loop for firstedyear and secondedyear - for books with publication date of two years (e.g. 1936/1937, I assumed the first date)

set trace on

global publicationyear firstedyear secondedyear

foreach var of global publicationyear {
	gen new_`var'=substr(`var', 1, 4)
}

set trace off

*noticed that new_firstedyear still contains nonnumeric characters:
tab firstedyear
drop if new_firstedyear == "Pfei"
drop if new_firstedyear == "um 1"

set trace on

global new_publicationyear new_firstedyear new_secondedyear

*destringing
foreach var of global new_publicationyear {
	destring `var', replace
}

*recasting
foreach var of global new_publicationyear {
	recast long `var'
}

set trace off

drop firstedyear secondedyear

rename new_firstedyear firstedyear
label var firstedyear "First edition's publication year"

rename new_secondedyear secondedyear
label var secondedyear "Second edition's publication year"

gen twicepublished = firstedyear*secondedyear
replace twicepublished = 1 if !missing(twicepublished)
replace twicepublished = 0 if missing(twicepublished)

save "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data\data_derived.dta"

clear

*end of data formatting

