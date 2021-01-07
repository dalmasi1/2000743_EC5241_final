clear
cd C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final
use "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data_derived.dta"

*Averaging:

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

*end of the aggregation part

*Graph:
twoway (bar ssflag century, sort) if !missing(century), ytitle(Mean of the additional police ban) ytitle(, orientation(vertical)) yscale(range(0 2)) ymtick(minmax, nolabels noticks) xtitle(Centuries) xscale(range(19 20))

outreg2 using graph.doc
shellout using `"graph.doc"'
seeout using "graph.txt"
graph save "Graph" "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\Graph.gph"

save "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data_ssflag_century_aggregated.dta"

