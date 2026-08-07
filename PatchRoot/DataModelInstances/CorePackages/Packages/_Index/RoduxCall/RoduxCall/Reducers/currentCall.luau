-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

local roduxCall = script:FindFirstAncestor("RoduxCall")
local roduxModule = require(roduxCall.Parent.Rodux)
local callStateModel = require(roduxCall.Models).CallStateModel
local updateCall = require(roduxCall.Actions).UpdateCall
local _ = require(script.Parent.Parent.roduxCallTypes)

return function() --[[ line: 11 ]]
	-- upvalues: roduxModule (ref), updateCall (ref), callStateModel (ref)
	return roduxModule.createReducer(nil, {
		[updateCall.name] = function(_, p0) --[[ line: 13 ]]
			-- upvalues: callStateModel (copy)
			return callStateModel.format(p0.payload.call)
		end
	})
end