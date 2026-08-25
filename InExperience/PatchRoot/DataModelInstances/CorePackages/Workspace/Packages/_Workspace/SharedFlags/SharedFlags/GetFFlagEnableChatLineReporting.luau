game:DefineFastFlag("EnableChatLineReporting2", false)

return function()
	return game:GetFastFlag("EnableChatLineReporting2") and game:GetEngineFeature("ChatLineAbuseReportAPIEnabled")
end