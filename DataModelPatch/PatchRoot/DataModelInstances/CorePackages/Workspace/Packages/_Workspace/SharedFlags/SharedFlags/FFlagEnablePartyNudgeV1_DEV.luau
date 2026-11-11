local GetFFlagIsSquadEnabledModule = require(script.Parent.GetFFlagIsSquadEnabled)

return game:DefineFastFlag("EnablePartyNudgeV1_DEV", false) and GetFFlagIsSquadEnabledModule()