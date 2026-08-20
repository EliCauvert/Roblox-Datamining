local getFFlagProfileFrameThumbnailEnabledModule = require(script.Parent.GetFFlagProfileFrameThumbnailEnabled)
game:DefineFastFlag("HomePYMKUseProfileFrameThumbnail", false)

return function() --[[ line: 5 ]]
	-- upvalues: getFFlagProfileFrameThumbnailEnabledModule (ref)
	return game:GetFastFlag("HomePYMKUseProfileFrameThumbnail") and getFFlagProfileFrameThumbnailEnabledModule()
end