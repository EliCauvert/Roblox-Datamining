local RoduxCall = script:FindFirstAncestor("RoduxCall")
local RoduxModule = require(RoduxCall.Parent.Rodux)
local SuggestedCalleeModel = require(RoduxCall.Models).SuggestedCalleeModel
local ClearSuggestedCallees = require(RoduxCall.Actions).ClearSuggestedCallees
local _ = require(script.Parent.Parent.roduxCallTypes)
local config = { suggestedCallees = {} }

return function(p1) --[[ Line: 11 ]]
	-- upvalues: RoduxModule (copy), config (copy), SuggestedCalleeModel (copy), ClearSuggestedCallees (copy)
	return RoduxModule.createReducer(config, {
		[p1.NetworkingCall.GetSuggestedCallees.Succeeded.name] = function(_, p2) --[[ Line: 14 ]]
			-- upvalues: SuggestedCalleeModel (upval)
			local SuggestedCallees = {}
			
			for _, suggestedCallee in ipairs(p2.responseBody.suggestedCallees) do
				assert(SuggestedCalleeModel.isValid(suggestedCallee))
				SuggestedCallees[#SuggestedCallees + 1] = SuggestedCalleeModel.format(suggestedCallee)
			end
			return { suggestedCallees = SuggestedCallees }
		end,
		[ClearSuggestedCallees.name] = function(_, _) --[[ Line: 29 ]]
			-- upvalues: config (upval)
			return config
		end
	})
end