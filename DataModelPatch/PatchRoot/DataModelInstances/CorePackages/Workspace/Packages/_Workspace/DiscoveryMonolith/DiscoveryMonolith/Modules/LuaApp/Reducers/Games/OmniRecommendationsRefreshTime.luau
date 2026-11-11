local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local CryoModule = require(DiscoveryMonolith.Parent.Cryo)
local SetOmniRecommendationsRefreshTimeModule = require(DiscoveryMonolith.Modules.LuaApp.Actions.Games.SetOmniRecommendationsRefreshTime)

return function(p1, p2)
	-- upvalues: SetOmniRecommendationsRefreshTimeModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetOmniRecommendationsRefreshTimeModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.pageType] = p2.refreshTime })
	end
	return P0
end