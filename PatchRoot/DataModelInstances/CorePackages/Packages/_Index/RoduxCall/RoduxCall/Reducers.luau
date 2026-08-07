-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

local roduxModule = require(script:FindFirstAncestor("RoduxCall").Parent.Rodux)
local currentCallModule = require(script.currentCall)
local suggestedCalleesModule = require(script.suggestedCallees)

return function(p0) --[[ line: 8 ]]
	-- upvalues: roduxModule (ref), currentCallModule (ref), suggestedCalleesModule (ref)
	return roduxModule.combineReducers({
		currentCall = currentCallModule(),
		suggestedCallees = suggestedCalleesModule(p0)
	})
end