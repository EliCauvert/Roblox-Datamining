game:DefineFastFlag("EnablePlayerNamesEnabledSetting", false)

return function() --[[ Line: 3 ]]
	return game:GetEngineFeature("EnablePlayerNamesEnabledSettingEngineFeature") and game:GetFastFlag("EnablePlayerNamesEnabledSetting")
end