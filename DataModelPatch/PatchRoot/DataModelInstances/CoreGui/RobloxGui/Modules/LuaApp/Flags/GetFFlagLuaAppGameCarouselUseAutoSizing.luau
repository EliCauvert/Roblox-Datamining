game:DefineFastFlag("LuaAppGameCarouselUseAutoSizing", false)

return function()
	return game:GetEngineFeature("AutomaticSizing2") and game:GetFastFlag("LuaAppGameCarouselUseAutoSizing") or false
end