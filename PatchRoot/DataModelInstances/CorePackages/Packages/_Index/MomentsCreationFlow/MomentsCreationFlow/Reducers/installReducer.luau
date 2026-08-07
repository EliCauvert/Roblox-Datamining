-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local roduxModule = require(momentsCreationFlow.Parent.Rodux)
local creationFlowModule = require(momentsCreationFlow.Reducers.CreationFlow)
local musicModule = require(momentsCreationFlow.Reducers.Music)

return function() --[[ line: 14 ]]
	-- upvalues: roduxModule (ref), creationFlowModule (ref), musicModule (ref)
	return roduxModule.combineReducers({ CreationFlow = creationFlowModule, Music = musicModule })
end