game:DefineFastFlag("LuaAppEnableOpenTypeSupport4", false)

return function()
	return game:GetEngineFeature("SupportOpenTypeFeatures") and game:GetFastFlag("LuaAppEnableOpenTypeSupport4")
end