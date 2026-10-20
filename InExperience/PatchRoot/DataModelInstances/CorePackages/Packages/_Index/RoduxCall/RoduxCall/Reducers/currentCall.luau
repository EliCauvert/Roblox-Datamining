local RoduxCall = script:FindFirstAncestor("RoduxCall")
local RoduxModule = require(RoduxCall.Parent.Rodux)
local CallStateModel = require(RoduxCall.Models).CallStateModel
local UpdateCall = require(RoduxCall.Actions).UpdateCall
local _ = require(script.Parent.Parent.roduxCallTypes)

return function()
	-- upvalues: RoduxModule (copy), UpdateCall (copy), CallStateModel (copy)
	return RoduxModule.createReducer(nil, {
		[UpdateCall.name] = function(_, p1)
			-- upvalues: CallStateModel (upval)
			return CallStateModel.format(p1.payload.call)
		end
	})
end