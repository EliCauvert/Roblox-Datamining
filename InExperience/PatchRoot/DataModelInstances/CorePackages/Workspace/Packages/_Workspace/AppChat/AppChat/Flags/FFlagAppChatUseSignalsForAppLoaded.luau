local FFlagShareTargetGameCleanup = require(script:FindFirstAncestor("AppChat").Parent.SharedFlags).FFlagShareTargetGameCleanup

return game:DefineFastFlag("AppChatUseSignalsForAppLoaded", false) and FFlagShareTargetGameCleanup