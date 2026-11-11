local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local OmniFeedConstants = require(Parent.DiscoveryTypes).OmniFeedConstants
local ApiFetchOmniRecommendationsModule = require(DiscoveryMonolith.Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations)

local function refreshOmniRecommendations(p1, p2, p3, p4)
	-- upvalues: ApiFetchOmniRecommendationsModule (copy), AppPage (copy), OmniFeedConstants (copy)
	return p3:dispatch(ApiFetchOmniRecommendationsModule(p1, p2, AppPage.Home, nil, nil, OmniFeedConstants.OmniRecommendationsRequestIntent.GameExit, p4)):catch(function(Err)
		warn("We failed to refresh omni recommendations on game exit!", Err)
	end)
end

return function(p1, p2, p3)
	-- upvalues: refreshOmniRecommendations (copy)
	return function(p4)
		-- upvalues: refreshOmniRecommendations (upval), p1 (copy), p2 (copy), p3 (copy)
		return refreshOmniRecommendations(p1, p2, p4, p3)
	end
end