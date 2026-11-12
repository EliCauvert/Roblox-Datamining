local FFlagEnableArgusModule = require(script.Parent.FFlagEnableArgus)
local FFlagArgoEnableMomentsModule = require(script.Parent.FFlagArgoEnableMoments)
local FFlagEnableSubTabOverrideModule = require(script.Parent.FFlagEnableSubTabOverride)
local SubTabAddMomentsFlagGating = game:DefineFastFlag("SubTabAddMomentsFlagGating", false)

return require(script.Parent.FFlagLuaAppIaHomeSubTab) or (FFlagEnableSubTabOverrideModule or SubTabAddMomentsFlagGating and (FFlagEnableArgusModule and FFlagArgoEnableMomentsModule))