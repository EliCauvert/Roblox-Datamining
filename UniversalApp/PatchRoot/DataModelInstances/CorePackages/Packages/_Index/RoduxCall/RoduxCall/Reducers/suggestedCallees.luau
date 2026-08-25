local roduxCall = script:FindFirstAncestor("RoduxCall")
local roduxModule = require(roduxCall.Parent.Rodux)
local suggestedCalleeModel = require(roduxCall.Models).SuggestedCalleeModel
local clearSuggestedCallees = require(roduxCall.Actions).ClearSuggestedCallees
local _ = require(script.Parent.Parent.roduxCallTypes)
local t = { suggestedCallees = {} }

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), suggestedCalleeModel (ref), clearSuggestedCallees (ref)
	return roduxModule.createReducer(t, {
		[p0.NetworkingCall.GetSuggestedCallees.Succeeded.name] = function(_, p1)
			-- upvalues: suggestedCalleeModel (copy)
			local t = {}
			
			for i, v in ipairs(p1.responseBody.suggestedCallees) do
				assert(suggestedCalleeModel.isValid(v))
				t[#t + 1] = suggestedCalleeModel.format(v)
			end
			return { suggestedCallees = t }
		end,
		[clearSuggestedCallees.name] = function(_, _)
			-- upvalues: t (copy)
			return t
		end
	})
end