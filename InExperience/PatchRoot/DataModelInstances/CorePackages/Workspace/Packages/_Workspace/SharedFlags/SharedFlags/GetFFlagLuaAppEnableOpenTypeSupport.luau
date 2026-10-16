game:DefineFastFlag("LuaAppEnableOpenTypeSupport4", false)

return function() --[[ Line: 3 ]]
	return game:GetEngineFeature("SupportOpenTypeFeatures") and game:GetFastFlag("LuaAppEnableOpenTypeSupport4")
end