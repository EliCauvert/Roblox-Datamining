local GetFFlagProfileFrameThumbnailEnabledModule = require(script.Parent.GetFFlagProfileFrameThumbnailEnabled)
game:DefineFastFlag("HomePYMKUseProfileFrameThumbnail", false)

return function()
	-- upvalues: GetFFlagProfileFrameThumbnailEnabledModule (copy)
	return game:GetFastFlag("HomePYMKUseProfileFrameThumbnail") and GetFFlagProfileFrameThumbnailEnabledModule()
end