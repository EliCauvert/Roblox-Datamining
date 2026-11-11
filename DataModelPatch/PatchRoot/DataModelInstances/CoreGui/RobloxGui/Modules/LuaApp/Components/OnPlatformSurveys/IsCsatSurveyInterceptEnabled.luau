local GuiService = game:GetService("GuiService")
game:DefineFastFlag("UniversalAppCsat4", false)

return function(): boolean
	-- upvalues: GuiService (copy)
	return game:GetEngineFeature("UniversalAppCsatAppStorageKey") and (game:GetFastFlag("UniversalAppCsat4") and not GuiService:IsTenFootInterface())
end