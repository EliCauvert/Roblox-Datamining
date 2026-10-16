local FFlagEnableArgusModule = require(script.Parent.FFlagEnableArgus)
local FFlagArgoEnableMomentsModule = require(script.Parent.FFlagArgoEnableMoments)
local SubTabAddMomentsFlagGating = game:DefineFastFlag("SubTabAddMomentsFlagGating", false)

return game:DefineFastFlag("LuaAppIaHomeSubTab", false) or SubTabAddMomentsFlagGating and (FFlagEnableArgusModule and FFlagArgoEnableMomentsModule)