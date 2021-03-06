#' Calibration Station
#'
#' Analyze series of runs on M1 and generate calibration curves for each target
#'
#' @inheritParams analyzeBiosensorData
#'
#' @export
calibrationStation <- function(celebrate = TRUE) {
        foldersList <- list.dirs(recursive = FALSE)
        directory <- getwd()
        lapply(foldersList, function(i){
                setwd(i)
                analyzeBiosensorCalData()
                setwd(directory)
        })
        x <- combineNetShifts()
        plotCombinedNetShifts(data = x)
        fitCalCurves(data = x)
        if (celebrate){shell.exec("https://youtu.be/dQw4w9WgXcQ")}
}
