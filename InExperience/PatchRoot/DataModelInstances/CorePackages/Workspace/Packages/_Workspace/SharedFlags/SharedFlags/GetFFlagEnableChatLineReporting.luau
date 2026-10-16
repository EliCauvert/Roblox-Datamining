game:DefineFastFlag("EnableChatLineReporting2", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("EnableChatLineReporting2") and game:GetEngineFeature("ChatLineAbuseReportAPIEnabled")
end