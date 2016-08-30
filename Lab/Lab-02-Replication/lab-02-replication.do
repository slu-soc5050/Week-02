// ==========================================================================

// Lab 02

// ==========================================================================

// standard opening options

version 14
log close _all
graph drop _all
clear all
set more off
set linesize 80

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// change directory

if "`c(os)'" == "MacOSX" {
  cd "/Users/`c(username)'/Desktop"
}
else if "`c(os)'" == "Windows" {
  cd "E:\Users\`c(username)'\Desktop"
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// check to see if source data exists

global sourceData 34434-0001-Data.dta
capture confirm file $sourceData

if _rc==601 {
  display in red "This do-file requires that the source dataset be saved in your working folder."
  exit
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// check to see if appropriate directories exists

global rootDir "Lab-02-Replication"
capture mkdir $rootDir
cd $rootDir

capture mkdir "Plots"

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// log process

log using lab-02.txt, text replace

// ==========================================================================

/*
file name - /*what is this do-file's name?*/.do

project name - /*what project is this for?*/

purpose - /*what does this do-file do?*/

created - /*what is today's date?*/

updated - /*what is today's date?*/

author - CHRIS
*/

// ==========================================================================

/*
full description -
/*enter a description of what this do-file does*/
*/

/*
updates -

*/

// ==========================================================================
/*
superordinates  -
- /*list data file and any other files needed at runtime*/
*/

/*
subordinates -
- /*list any subfiles this do-file calls*/
*/

// ==========================================================================

// copy source data to new directory

cd ..
copy $sourceData "$rootDir/lab-02-data.dta", replace
cd $rootDir

// ==========================================================================
// ==========================================================================
// ==========================================================================

// 9a. Open dataset

use lab-02-data.dta

// ==========================================================================

// 9b. Find the mode of HRNUMHOU (total number of persons living in house)

tabulate HRNUMHOU, sort

// ==========================================================================

// 9c. Find the mean, median, variance, and std dev for HRNUMHOU

summarize HRNUMHOU, detail

// ==========================================================================

// 9d. Find the range of HRNUMHOU

tabstat HRNUMHOU, statistics(range)

// ==========================================================================

// 9e. Find the mode of HETENURE (housing ownership)

tabulate HETENURE, sort

// ==========================================================================

// 9f. Bar chart for HETENURE

graph bar (count), over(HETENURE) ///
	title("Housing Ownership") ///
	subtitle("Original graph with default x-axis") ///
	note("Produced by Christopher Prener; Data via 2011 CPS") ///
	scheme(s2mono)

graph export "Plots/fig1a.png", width(800) height(600) replace
	
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Fixing the x-axis labels
/* When you make the graph for 9f, you'll see that the labels do not
fit on the x-axis well. These can be modified by using the suboption
illustrated below. */	

graph bar (count), over(HETENURE, ///
	relabel(1 "Blank" 2 "Owned" 3 "Rented" 4 "Occupied w/o Payment")) ///
	title("Housing Ownership") ///
	subtitle("Modified graph with new x-axis labels") ///
	note("Produced by Christopher Prener; Data via 2011 CPS") ///
	scheme(s2mono)

graph export "Plots/fig1b.png", width(800) height(600) replace

// ==========================================================================

// 9g. Histogram for HRNUMHOU

histogram HRNUMHOU, frequency bin(10) ///
	title("Persons in Household") ///
	subtitle("Original graph with default y-axis") ///
	note("Produced by Christopher Prener; Data via 2011 CPS") ///
	scheme(s2mono)

graph export "Plots/fig2a.png", width(800) height(600) replace
	
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Fixing the y-axis labels
/* When you make the graph for 9g, you'll see that the labels do not fit
the y-axis well. Instead Stata renders them in scientific notation. To
remove that and replace it with a number, you can use the ylabel option
with the format suboption. 

The numbers refer to the number of digits to be displayed - in this case
it is 6 digits with no (the zero) decimal points. 

This is illustrated below. Type help format in Stata for more details. */

histogram HRNUMHOU, frequency bin(10) ///
	ylabel(,format(%6.0f)) ///
	title("Persons in Household") ///
	subtitle("Modified graph with new y-axis") ///
	note("Produced by Christopher Prener; Data via 2011 CPS") ///
	scheme(s2mono)

graph export "Plots/fig2b.png", width(800) height(600) replace

// ==========================================================================

// 9h. Box plot for HRNUMHOU

graph box HRNUMHOU, ///
	title("Persons in Household") ///
	subtitle("Diagnostic box plot") ///
	note("Produced by Christopher Prener; Data via 2011 CPS") ///
	scheme(s2mono)

graph export "Plots/fig3.png", width(800) height(600) replace
	
// ==========================================================================
// ==========================================================================
// ==========================================================================

// standard closing options

log close _all
graph drop _all
set more on

// ==========================================================================

exit
