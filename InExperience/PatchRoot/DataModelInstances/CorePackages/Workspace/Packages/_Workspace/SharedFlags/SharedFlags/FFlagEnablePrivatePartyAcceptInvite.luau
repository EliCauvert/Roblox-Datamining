local GetFFlagIsSquadEnabledModule = require(script.Parent.GetFFlagIsSquadEnabled)

return game:GetEngineFeature("PrivatePartyJoin") and (GetFFlagIsSquadEnabledModule() and game:DefineFastFlag("EnablePrivatePartyAcceptInvite", false))