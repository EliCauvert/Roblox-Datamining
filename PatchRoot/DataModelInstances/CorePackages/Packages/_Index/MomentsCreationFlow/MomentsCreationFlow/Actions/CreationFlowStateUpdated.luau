-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local _ = require(momentsCreationFlow.Enums.CreationFlowState)

return require(momentsCreationFlow.Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 12 ]]
	return { currentState = p0 }
end)