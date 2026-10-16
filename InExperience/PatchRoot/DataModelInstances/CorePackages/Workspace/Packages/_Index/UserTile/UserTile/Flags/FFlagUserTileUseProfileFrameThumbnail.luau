local GetFFlagProfileFrameThumbnailEnabledFunction = require(script:FindFirstAncestor("UserTile").Parent.SharedFlags).GetFFlagProfileFrameThumbnailEnabled

return game:DefineFastFlag("UserTileUseProfileFrameThumbnail", false) and GetFFlagProfileFrameThumbnailEnabledFunction()