clear
use "C:\Users\David\Desktop\CEU\Coding\2000743_EC5241_final\data_derived.dta"

*Data Analysis

*Regression:
reg ssflag firstedyear twicepublished
outreg2 using regtable.doc
seeout using "regtable.txt"

