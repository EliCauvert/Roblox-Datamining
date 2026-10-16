local GetFFlagProfileFrameThumbnailEnabledFunction = require(script:FindFirstAncestor("Squads").Parent.SharedFlags).GetFFlagProfileFrameThumbnailEnabled

return game:DefineFastFlag("SquadsUseProfileFrameThumbnail", false) and GetFFlagProfileFrameThumbnailEnabledFunction()