game:DefineFastFlag("AbuseReportMenuOpenCloseSignal", false)

return function() --[[ Line: 3 ]]
	return if game:GetEngineFeature("AbuseReportMenuOpenCloseSignal") then game:GetFastFlag("AbuseReportMenuOpenCloseSignal") else false
end