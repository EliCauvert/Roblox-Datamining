local GetFFlagProfileFrameThumbnailEnabledFunction = require(script:FindFirstAncestor("AppChat").Parent.SharedFlags).GetFFlagProfileFrameThumbnailEnabled

return game:DefineFastFlag("AppChatUseProfileFrameThumbnail", false) and GetFFlagProfileFrameThumbnailEnabledFunction()