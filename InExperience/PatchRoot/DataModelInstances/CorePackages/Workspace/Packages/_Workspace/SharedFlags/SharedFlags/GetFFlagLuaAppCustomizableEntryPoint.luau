game:DefineFastFlag("LuaAppCustomizableEntryPoint2", false)

return function() --[[ Line: 3 ]]
	return game:GetEngineFeature("CustomAppEntryPointAutoJoin") and game:GetFastFlag("LuaAppCustomizableEntryPoint2")
end