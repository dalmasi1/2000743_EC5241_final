clear

cd C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final

use "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data\data_derived.dta"

*Data Analysis

*Regression:
reg ssflag firstedyear twicepublished

cd C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\output

outreg2 using regtable.doc
seeout using "regtable.txt"

*end of data analysis.

clear, exit



