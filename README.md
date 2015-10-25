# _Getting and Cleaning Data_ Course Project

This is the course project for the Coursera course [Getting and Cleaning Data](https://www.coursera.org/course/getdata) presented by Johns Hopkins
University.

The purpose of this project is to product a tidy data set from raw data
collected from accelerometers of a number of Samsung Galaxy S smartphones
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]().
A full description is available at the site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]().

All code for this project is contained within [`run_analysis.R`](run_analysis.R).
To reproduce the
tidy data set from the raw data set, set your current working directory
to the directory containing `run_analysis.R`, then run the script with no
inputs, which does the following:

1. Looks for a file named `getdata-projectfiles-UCI-HAR-Dataset.zip`
(containing the raw data) in the current working directory
1. If there is no such file it does the following:
    a. Downloads https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to the file named `getdata-projectfiles-UCI-HAR-Dataset.zip` in the current working directory
    a. Unzips the downloaded file into the current working directory, creating
    a subdirectory named `UCI HAR Dataset`
1. Sets the download date to the last modified time of the zip file
1. Produces a tidy data set in a file named `tidy.txt` in the current working
directory

See [CodeBook.md](CodeBook.md) for the details regarding the variables, the
data, and the work performed to produce the tidy data set.

The tidy data set was produced with the following:

    library(devtools)
    devtools::session_info()
    #> Session info -----------------------------------------------------------------------------------------
    #>  setting  value                       
    #>  version  R version 3.2.2 (2015-08-14)
    #>  system   x86_64, darwin13.4.0        
    #>  ui       RStudio (0.99.484)          
    #>  language (EN)                        
    #>  collate  en_US.UTF-8                 
    #>  tz       America/New_York            
    #>  date     2015-10-21                  
    #> 
    #> Packages ---------------------------------------------------------------------------------------------
    #>  package    * version date       source        
    #>  assertthat   0.1     2013-12-06 CRAN (R 3.2.0)
    #>  chron        2.3-47  2015-06-24 CRAN (R 3.2.0)
    #>  data.table * 1.9.6   2015-09-19 CRAN (R 3.2.0)
    #>  DBI          0.3.1   2014-09-24 CRAN (R 3.2.0)
    #>  devtools     1.9.1   2015-09-11 CRAN (R 3.2.0)
    #>  digest       0.6.8   2014-12-31 CRAN (R 3.2.0)
    #>  dplyr      * 0.4.3   2015-09-01 CRAN (R 3.2.0)
    #>  lazyeval     0.1.10  2015-01-02 CRAN (R 3.2.0)
    #>  magrittr     1.5     2014-11-22 CRAN (R 3.2.0)
    #>  memoise      0.2.1   2014-04-22 CRAN (R 3.2.0)
    #>  plyr         1.8.3   2015-06-12 CRAN (R 3.2.0)
    #>  R6           2.1.1   2015-08-19 CRAN (R 3.2.0)
    #>  Rcpp         0.12.1  2015-09-10 CRAN (R 3.2.0)
    #>  reshape2   * 1.4.1   2014-12-06 CRAN (R 3.2.0)
    #>  rstudioapi   0.3.1   2015-04-07 CRAN (R 3.2.0)
    #>  stringi      0.5-5   2015-06-29 CRAN (R 3.2.0)
    #>  stringr    * 1.0.0   2015-04-30 CRAN (R 3.2.0)
