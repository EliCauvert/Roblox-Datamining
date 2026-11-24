local Parent = script:FindFirstAncestor("SearchResults").Parent
local _ = require(Parent.UniversalAppPolicy)
local FFlagSduiConditionalPropsAppPolicyCondition = require(Parent.SharedFlags).FFlagSduiConditionalPropsAppPolicyCondition
local Surface = {
	SearchOmnisearchExperiences = "SearchOmnisearchExperiences",
	SearchPowerSearch = "SearchPowerSearch",
	SearchMarketplace = "SearchMarketplace",
	SearchOmnisearchGameItems = "SearchOmnisearchGameItems",
	HomeRecommendedForYou = "HomeRecommendedForYou"
}
local config = {
	[Surface.SearchOmnisearchExperiences] = function(p1)
		return p1.getShowInContextPersonalizedRecommendationsSearchOmnisearchExperiences()
	end,
	[Surface.SearchPowerSearch] = function(p1)
		return p1.getShowInContextPersonalizedRecommendationsSearchPowerSearch()
	end,
	[Surface.SearchMarketplace] = function(p1)
		return p1.getShowInContextPersonalizedRecommendationsSearchMarketplace()
	end,
	[Surface.SearchOmnisearchGameItems] = function(p1)
		return p1.getShowInContextPersonalizedRecommendationsSearchOmnisearchGameItems()
	end,
	[Surface.HomeRecommendedForYou] = function(p1)
		return p1.getShowInContextPersonalizedRecommendationsHomeRecommendedForYou()
	end
}

return {
	Surface = Surface,
	isInContextRecommendationsEnabled = function(p1, p2)
		-- upvalues: config (copy), FFlagSduiConditionalPropsAppPolicyCondition (copy)
		local Entry = config[p2]
		
		return Entry ~= nil and (FFlagSduiConditionalPropsAppPolicyCondition and p1.getShowInContextPersonalizedRecommendationsSettings() and Entry(p1) or false)
	end
}