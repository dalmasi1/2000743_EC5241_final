clear
cd C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final
use "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data\data_derived.dta"

*Averaging:

*creating a variable for the decades the publication of the books in order to demonstrate data aggregation

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

save "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data\data_ssflag_century_aggregated.dta"
*end of the aggregation part



*Graph:
use "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data\data_derived.dta"
histogram firstedyear, discrete ytitle(Density) xtitle(Years) title(Histogram of the first publication year of books)
cumul firstedyear, gen(cum)
twoway (line cum firstedyear, sort), ytitle(Cumulative) xtitle(Year) title(Cumulative Distribution of the Publication Dates of Books) xsize(20) ysize(10) scale(1)

pwd
cd C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\output

graph save "Graph" "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\output\Graph.gph"
graph export "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\output\Graph.png", as (png) name("Graph")

*end of graph making


