local GetFFlagProfileFrameThumbnailEnabledFunction = require(script:FindFirstAncestor("UserTile").Parent.SharedFlags).GetFFlagProfileFrameThumbnailEnabled

return game:DefineFastFlag("UserTileIncludeProfileFrameProp", false) and GetFFlagProfileFrameThumbnailEnabledFunction()