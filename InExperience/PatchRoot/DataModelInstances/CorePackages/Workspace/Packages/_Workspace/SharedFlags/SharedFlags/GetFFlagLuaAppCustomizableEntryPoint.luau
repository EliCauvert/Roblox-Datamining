game:DefineFastFlag("LuaAppCustomizableEntryPoint2", false)

return function()
	return game:GetEngineFeature("CustomAppEntryPointAutoJoin") and game:GetFastFlag("LuaAppCustomizableEntryPoint2")
end