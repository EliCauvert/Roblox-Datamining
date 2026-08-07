game:DefineFastFlag("AbuseReportMenuOpenCloseSignal", false)

return function() --[[ line: 3 ]]
	return if game:GetEngineFeature("AbuseReportMenuOpenCloseSignal") then game:GetFastFlag("AbuseReportMenuOpenCloseSignal") else false
end