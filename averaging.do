clear
use "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data_derived.dta"

*preparing the analysis sample

*creating a variable for the decades the publication of the books

browse
sort firstedyear
tab firstedyear

gen int century = 20 if firstedyear >= 1900
replace century = 19 if firstedyear < 1900
replace century = . if missing(firstedyear)

tab century
tab ssflag

mean ssflag if century == 19
mean ssflag if century == 20

collapse ssflag, by(century)
*note: this table shows the difference between police-prohibited books published in the 1800s and 1900s. 

label var century "Century"
label var ssflag "Mean of the additional ban issued by the Reichsführer SS and the chief of the German police"

save "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data_ssflag_century_aggregated.dta"
*end of the aggragation part