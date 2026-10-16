game:DefineFastFlag("ReportAnythingAnnotationIXP", false)

return function() --[[ Line: 3 ]]
	return game:GetEngineFeature("ReportAnythingScreenshotOrientation") and game:GetFastFlag("ReportAnythingAnnotationIXP")
end