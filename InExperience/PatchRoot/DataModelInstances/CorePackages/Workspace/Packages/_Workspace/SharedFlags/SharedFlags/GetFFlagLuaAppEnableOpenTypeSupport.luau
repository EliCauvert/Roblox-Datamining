game:DefineFastFlag("LuaAppEnableOpenTypeSupport4", false)

return function() --[[ line: 3 ]]
	return game:GetEngineFeature("SupportOpenTypeFeatures") and game:GetFastFlag("LuaAppEnableOpenTypeSupport4")
end