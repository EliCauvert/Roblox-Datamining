local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local CryoModule = require(DiscoveryMonolith.Parent.Cryo)
local SetOmniRecommendationsMetadataRequestStatusModule = require(DiscoveryMonolith.Modules.LuaApp.Actions.Games.SetOmniRecommendationsMetadataRequestStatus)

return function(p1, p2)
	-- upvalues: SetOmniRecommendationsMetadataRequestStatusModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetOmniRecommendationsMetadataRequestStatusModule.name then
		local JoinResults = {}
		
		for i, contentId in pairs(p2.contentIds) do
			JoinResults[i] = CryoModule.Dictionary.join(P0[i] or {}, contentId)
		end
		P0 = CryoModule.Dictionary.join(P0, JoinResults)
	end
	return P0
end