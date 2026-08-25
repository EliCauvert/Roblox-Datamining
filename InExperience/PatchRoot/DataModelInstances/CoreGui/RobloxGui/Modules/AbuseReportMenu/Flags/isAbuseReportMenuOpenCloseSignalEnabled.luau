game:DefineFastFlag("AbuseReportMenuOpenCloseSignal", false)

return function()
	return if game:GetEngineFeature("AbuseReportMenuOpenCloseSignal") then game:GetFastFlag("AbuseReportMenuOpenCloseSignal") else false
end