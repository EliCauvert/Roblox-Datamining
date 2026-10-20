local RoduxModule = require(script:FindFirstAncestor("CommunityLinks").Parent.Rodux)
local ExperienceCommunityLinksModule = require(script.Parent.ExperienceCommunityLinks)

return function()
	-- upvalues: RoduxModule (copy), ExperienceCommunityLinksModule (copy)
	return RoduxModule.combineReducers({
		ExperienceCommunityLinks = ExperienceCommunityLinksModule
	})
end