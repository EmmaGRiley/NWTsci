library(roxygen2)
library(tidyhydat.ws)
library(readxl)
library(magrittr)

#'Function to update provisional hydrometric data
#'
#'Takes existing station RDS files in the working directory and
#'updates them with real time hydrometric data.
#'@param variables Options are 46, (water level, primary sensor), 47 (discharge, primary sensory derived), 5 (water temperature), 16(water level, primary sensor), 52 (water level, primary sensor). List chosen parameters inside c().
#'@return Saves new RDS files in the working directory.
#'@examples
#'updatehydat(variables = c(46, 47))
#'Saves new RDS files with updated water level and discharge values.
#'@export
updatehydat = function(station_number = names, #names of stations saved in the filepath
                       variables, #choose 46 (water level, primary sensor), 47 (discharge, primary sensory derived), 5 (water temperature), 16(water level, primary sensor), 52 (water level, primary sensor)
                       ext= "*.rds",
                       param_id = tidyhydat.ws::param_id)

{
  data.files = list.files(pattern=ext)
  files = lapply(data.files, readRDS)
  names = tools::file_path_sans_ext(data.files)
  newfiles = tidyhydat.ws::realtime_ws(station_number = names,
                          parameters = variables,
                          start_date = max(files[[length(files)]]$Date),
                          end_date = Sys.time(),
                          token = tidyhydat.ws::token_ws())

  existingfiles = files %>%
  dplyr::bind_rows(files)

  updatedfiles = rbind(existingfiles, newfiles)

  for (i in unique(updatedfiles$STATION_NUMBER))
  {namedata = c(i,".rds")
   filename = paste(namedata[1],namedata[2])
    saveRDS(updatedfiles[updatedfiles$STATION_NUMBER==i, ], file=filename)}

}

