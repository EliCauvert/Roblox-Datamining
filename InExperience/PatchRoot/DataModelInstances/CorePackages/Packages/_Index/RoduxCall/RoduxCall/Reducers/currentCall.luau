local roduxCall = script:FindFirstAncestor("RoduxCall")
local roduxModule = require(roduxCall.Parent.Rodux)
local callStateModel = require(roduxCall.Models).CallStateModel
local updateCall = require(roduxCall.Actions).UpdateCall
local _ = require(script.Parent.Parent.roduxCallTypes)

return function()
	-- upvalues: roduxModule (ref), updateCall (ref), callStateModel (ref)
	return roduxModule.createReducer(nil, {
		[updateCall.name] = function(_, p0)
			-- upvalues: callStateModel (copy)
			return callStateModel.format(p0.payload.call)
		end
	})
end