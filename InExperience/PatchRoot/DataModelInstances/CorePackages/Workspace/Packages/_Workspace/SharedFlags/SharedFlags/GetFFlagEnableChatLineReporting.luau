game:DefineFastFlag("EnableChatLineReporting2", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("EnableChatLineReporting2") and game:GetEngineFeature("ChatLineAbuseReportAPIEnabled")
end