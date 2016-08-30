// ==========================================================================

// Problem Set 01

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

global sourceData 36147-0003-Data.dta
capture confirm file $sourceData

if _rc==601 {
  display in red "This do-file requires that the source dataset be saved in your working folder."
  exit
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// check to see if appropriate directories exists

global rootDir "ProblemSet-01"
capture mkdir $rootDir
cd $rootDir

capture mkdir "Plots"

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// log process

log using ps-01.txt, text replace

// ==========================================================================

/*
file name - ps-01.do

project name - SOC5050 - Quantitative Analysis - Spring 2016

purpose - Problem Set 01

created - /*what is today's date?*/

updated - /*what is today's date?*/

author - /*what is your name?*/
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
copy $sourceData "$rootDir/ps-01-data.dta", replace
cd $rootDir

// ==========================================================================
// ==========================================================================
// ==========================================================================

/*begin writing commands here*/



// ==========================================================================
// ==========================================================================
// ==========================================================================

// standard closing options

log close _all
graph drop _all
set more on

// ==========================================================================

exit
