local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local CryoModule = require(DiscoveryMonolith.Parent.Cryo)
local AddOmniRecommendationsModule = require(DiscoveryMonolith.Modules.LuaApp.Actions.Games.AddOmniRecommendations)

return function(p1, p2)
	-- upvalues: AddOmniRecommendationsModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == AddOmniRecommendationsModule.name then
		if p2.isAppend then
			for i, recommendation in pairs(p2.recommendations) do
				local Entry = P0[i]
				
				if Entry then
					local JoinResult = CryoModule.Dictionary.join(Entry, recommendation)
					JoinResult.sorts = CryoModule.List.join(Entry.sorts, recommendation.sorts)
					JoinResult.metadata = nil
					P0 = CryoModule.Dictionary.join(P0, { [i] = JoinResult })
				end
			end
			return P0
		else
			local Copy = table.clone(p2.recommendations)
			
			for i1, value in Copy do
				Copy[i1] = CryoModule.Dictionary.join(value, { metadata = CryoModule.None })
			end
			P0 = CryoModule.Dictionary.join(P0, Copy)
		end
	end
	return P0
end