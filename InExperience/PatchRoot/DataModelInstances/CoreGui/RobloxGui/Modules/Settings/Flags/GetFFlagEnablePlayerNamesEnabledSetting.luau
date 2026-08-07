game:DefineFastFlag("EnablePlayerNamesEnabledSetting", false)

return function() --[[ line: 3 ]]
	return game:GetEngineFeature("EnablePlayerNamesEnabledSettingEngineFeature") and game:GetFastFlag("EnablePlayerNamesEnabledSetting")
end