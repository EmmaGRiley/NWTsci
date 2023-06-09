% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ClimatedataQAQC.R
\name{temporalmeans}
\alias{temporalmeans}
\title{Temporal means}
\usage{
temporalmeans(x)
}
\arguments{
\item{x}{The hourly dataframe}
}
\description{
Function to convert hourly to daily to monthly values for raw met station data
}
\details{
Writes two excel files to the working directory - one for daily and one for monthly values of 
Air Temperature, Relative Humidity, Rainfall, Wind speed and
Net Radiation.

Hourly variables in dataframe must be written exactly as above.

Calculates daily means only if there are at least 20 hourly values recorded in a day. Calculates monthly means only if there are at least 25 daily means in a month.
}
\examples{
`Air Temperature`<-c(21, 22, 23, 23, 23, 21, 21, 22, 23, 23, 23, 21, 21, 22, 23, 23, 23, NA, NA, NA, NA, 21, 18, 29)
`Relative Humidity`<-c(78, 79, 80, 81, 82, 83, 88, 90, 92, 95, 98, NA, NA, NA, NA, NA, 98, 95, 82, 80, 80, 79, 70, 71)
`Rainfall`<-c(0, 0, 0, 0, 0, 0, 0.1, 0.2, 0.4, 9.2, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.2, 0.4, 9.2, 0, 0)
`Wind Speed`<-c(1.2, 1.4, 0.8, 0.7, 0.2, 0.5, 1.2, 1.4, 0.8, 0.7, 0.2, 0.5, 1.2, 1.4, 0.8, 0.7, 0.2, 0.5, 1.2, 1.4, 0.8, 0.7, 0.2, 0.5)
`Net Radiation`<-c(54, 50, 50, 60, 80, 100, 150, 120, 180, 200, 180, 160, 140, 120, 100, 80, 60, 50, 50, 30, 20, 20, 10, 10)
Year<-c(1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999, 1999)
JD<-c(287, 287, 287, 287, 287, 287,  287, 287, 287, 287, 287, 287, 287, 287, 287, 287, 287, 287, 287, 287, 287, 287, 287, 287)
x<-cbind.data.frame(Year, JD, `Air Temperature`, `Relative Humidity`, `Rainfall`, `Wind Speed`, `Net Radiation`)
temporalmeans(x) #returns
#writes excel files "dailymeansx.xlsx" and monthlymeansx.xlsx to the working directory. Where x is the name of the hourly dataframe.
#should contain Year	JD	dailyairT	dailyRH	dailyRain	dailyWS	dailyQ
#                1999	287	     22.3	   #N/A	     19.8	   0.8	86.42
}
