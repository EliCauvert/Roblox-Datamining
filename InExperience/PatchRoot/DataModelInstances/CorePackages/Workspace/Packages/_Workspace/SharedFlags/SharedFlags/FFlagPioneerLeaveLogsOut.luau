local FFlagEnablePioneerPostAuthGameJoinModule = require(script.Parent.FFlagEnablePioneerPostAuthGameJoin)

return game:DefineFastFlag("PioneerLeaveLogsOut", false) and (FFlagEnablePioneerPostAuthGameJoinModule and (game:GetEngineFeature("ExperienceLeaveReasonEnabled") and game:GetEngineFeature("PioneerReturnToLuaAppOnReasonedLeave")))