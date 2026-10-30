local FFlagShareTargetGameCleanup = require(script:FindFirstAncestor("AppChat").Parent.SharedFlags).FFlagShareTargetGameCleanup

return game:DefineFastFlag("AppChatUseDataHydrationForPlaceInfos", false) and FFlagShareTargetGameCleanup