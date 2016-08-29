// ==========================================================================

// Week 02 Commands Example

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
  cd "/Users/`c(username)'/Documents/Working"
}
else if "`c(os)'" == "Windows" {
  cd "E:\Users\`c(username)'\Documents\Working"
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// check to see if appropriate directories exists

global rootDir "Week-02-Examples"
capture mkdir $rootDir
cd $rootDir

capture mkdir "Plots"

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// log process

log using week-02-stataCommands.txt, text replace

// ==========================================================================

/*
file name - week-02-stataCommands.do

project name - SOC5050 - Quantitative Analysis - Spring 2016

purpose - Illustrate Week 02's commands

created - 29 Aug 2016

updated - 29 Aug 2016

author - CHRIS
*/

// ==========================================================================

/*
full description -
This do-file illustrates most of the commands for Week 02. Opening
new datasets is omitted from this example.
*/

/*
updates -
none
*/

// ==========================================================================
/*
superordinates  -
- auto.dta (pre-installed with Stata)
*/

/*
subordinates -
- none
*/

// ==========================================================================
// ==========================================================================
// ==========================================================================

// 1. Opening Datasets

// 1a. Opening datasets

// use 34434-0001-Data.dta

// working example omitted

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// 1b. Opening pre-installed data

sysuse auto.dta

// ==========================================================================

// 2. Descriptive statistics: Mode

tabulate mpg, sort

// ==========================================================================

// 3. Descriptive statistics: Deatiled summary

summarize mpg, detail

// ==========================================================================

// 4. Descriptive statistics: specific values

tabstat mpg, statistics(range iqr)

// ==========================================================================

// 5. Bar charts

// 5a. Regular bar chart

graph bar (count), over(rep78) ///
  scheme(s2mono) ///
  title("Repair Record") ///
  subtitle("1978 Vehicles") ///
  note("Produced by Christopher Prener, Ph.D.; Data via Stata")

graph export "Plots/fig1.png", width(800) height(600) replace

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// 5b. Horizontal bar chart

graph hbar (count), over(rep78) ///
  scheme(s2mono) ///
  title("Repair Record") ///
  subtitle("1978 Vehicles") ///
  note("Produced by Christopher Prener, Ph.D.; Data via Stata")

graph export "Plots/fig2.png", width(800) height(600) replace

// ==========================================================================

// 6. Histogram with Altered Bins

histogram mpg, frequency bin(12) ///
  scheme(s2mono) ///
  title("Miles per Gallon") ///
  subtitle("1978 Vehicles") ///
  note("Produced by Christopher Prener, Ph.D.; Data via Stata")

graph export "Plots/fig3.png", width(800) height(600) replace

// ==========================================================================

// 7. Box Plots

// 7a. Regular box plot

graph box mpg, ///
  scheme(s2mono) ///
  title("Miles per Gallon") ///
  subtitle("1978 Vehicles") ///
  note("Produced by Christopher Prener, Ph.D.; Data via Stata")

graph export "Plots/fig4.png", width(800) height(600) replace

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// 7b. Horizontal box plot

graph hbox mpg, ///
  scheme(s2mono) ///
  title("Miles per Gallon") ///
  subtitle("1978 Vehicles") ///
  note("Produced by Christopher Prener, Ph.D.; Data via Stata")

graph export "Plots/fig5.png", width(800) height(600) replace

// ==========================================================================
// ==========================================================================
// ==========================================================================

// standard closing options

log close _all
graph drop _all
set more on

// ==========================================================================

exit
