local getFFlagProfileFrameThumbnailEnabledModule = require(script.Parent.GetFFlagProfileFrameThumbnailEnabled)
game:DefineFastFlag("HomePYMKUseProfileFrameThumbnail", false)

return function()
	-- upvalues: getFFlagProfileFrameThumbnailEnabledModule (ref)
	return game:GetFastFlag("HomePYMKUseProfileFrameThumbnail") and getFFlagProfileFrameThumbnailEnabledModule()
end