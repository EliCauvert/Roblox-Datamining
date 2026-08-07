game:DefineFastFlag("ReportAnythingAnnotationIXP", false)

return function() --[[ line: 3 ]]
	return game:GetEngineFeature("ReportAnythingScreenshotOrientation") and game:GetFastFlag("ReportAnythingAnnotationIXP")
end