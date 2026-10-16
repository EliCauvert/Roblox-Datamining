local GetFFlagProfileFrameThumbnailEnabledModule = require(script.Parent.GetFFlagProfileFrameThumbnailEnabled)
game:DefineFastFlag("HomePYMKUseProfileFrameThumbnail", false)

return function() --[[ Line: 5 ]]
	-- upvalues: GetFFlagProfileFrameThumbnailEnabledModule (copy)
	return game:GetFastFlag("HomePYMKUseProfileFrameThumbnail") and GetFFlagProfileFrameThumbnailEnabledModule()
end