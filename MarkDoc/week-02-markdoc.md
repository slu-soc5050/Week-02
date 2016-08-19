MarkDoc Example
===============

-   SOC 5050: Quantitative Analysis
-   Christopher Prener, PhD
-   29 Aug 2016

### Structuring the do-file

There are a total of three commands that must be included in every
do-file that executes MarkDoc code. They will not appear in your output
file but must be included in the do-fi le as they are in
`week-01-markdoc.do`. See the `week-01-markdocQuickRef.pdf` file for d
etails on those commands.

### Suppressing output

You can suppress output by using `//OFF` and `//ON` commands. In this
example, the comman d for opening the data is suppressed from the
output.

### Writing basic text

You can write basic text by wrapping it in the special MarkDoc comment
syntax: `/***` and `***/`. All of the text included in the output file
for this example is wrapped in thos e comment syntax symbols.

The `auto.dta` dataset contains the following variables:

          .  describe
          
          Contains data from /Applications/Stata/ado/base/a/auto.dta
            obs:            74                          1978 Automobile Data
           vars:            12                          13 Apr 2014 17:45
           size:         3,182                          (_dta has notes)
          ------------------------------------------------------------------------------------------
                        storage   display    value
          variable name   type    format     label      variable label
          ------------------------------------------------------------------------------------------
          make            str18   %-18s                 Make and Model
          price           int     %8.0gc                Price
          mpg             int     %8.0g                 Mileage (mpg)
          rep78           int     %8.0g                 Repair Record 1978
          headroom        float   %6.1f                 Headroom (in.)
          trunk           int     %8.0g                 Trunk space (cu. ft.)
          weight          int     %8.0gc                Weight (lbs.)
          length          int     %8.0g                 Length (in.)
          turn            int     %8.0g                 Turn Circle (ft.)
          displacement    int     %8.0g                 Displacement (cu. in.)
          gear_ratio      float   %6.2f                 Gear Ratio
          foreign         byte    %8.0g      origin     Car type
          ------------------------------------------------------------------------------------------
          Sorted by: foreign
          
          

### Cleaning Up

MarkDoc does not parse text perfectly, and sometimes introduces spaces
into words. For ex ample, "those" may become "thos e". Make sure to
carefully scan your file for typos befo re submitting it.

MarkDoc will also occasionally leave the `quietly log` command in the
bottom of the outpu t. Make sure to delete this from your output before
submitting it.

          .  quietly log close markdoc
          
