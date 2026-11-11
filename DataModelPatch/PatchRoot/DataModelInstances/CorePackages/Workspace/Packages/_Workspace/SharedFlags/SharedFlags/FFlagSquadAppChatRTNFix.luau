local GetFFlagIsSquadEnabledModule = require(script.Parent.GetFFlagIsSquadEnabled)

return if game:DefineFastFlag("SquadAppChatRTNFixWithSquadMainFlag", false) then GetFFlagIsSquadEnabledModule() else game:DefineFastFlag("SquadAppChatRTNFix", false)