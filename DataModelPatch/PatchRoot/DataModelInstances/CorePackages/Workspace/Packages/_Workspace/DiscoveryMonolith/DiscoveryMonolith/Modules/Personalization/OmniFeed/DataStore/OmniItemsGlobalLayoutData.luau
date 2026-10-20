local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AddOmniRecommendationsModule = require(DiscoveryMonolith.Modules.LuaApp.Actions.Games.AddOmniRecommendations)

return function(p1, p2)
	-- upvalues: AddOmniRecommendationsModule (copy), AppPage (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == AddOmniRecommendationsModule.name then
		for i, recommendation in pairs(p2.recommendations) do
			if i == AppPage.Home then
				assert(i == recommendation.pageType, "Should match page type")
				
				if recommendation.globalLayoutData then
					if p2.isAppend then
						P0 = CryoModule.Dictionary.join(P0, recommendation.globalLayoutData)
					else
						P0 = CryoModule.Dictionary.join({}, recommendation.globalLayoutData)
					end
				end
			end
		end
	end
	return P0
end