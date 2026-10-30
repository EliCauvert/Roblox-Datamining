local Moments = script:FindFirstAncestor("Moments")
local UseIsPersonalizedFeedModule = require(Moments.Hooks.useIsPersonalizedFeed)
local UseLocalizationFunction = require(Moments.Parent.Localization).Hooks.useLocalization
local config = {
	recommended = "Feature.Moments.Label.FeedRecommended",
	trending = "Feature.Moments.Label.FeedTrending"
}
local config1 = { recommended = "Recommended", trending = "Trending" }

return function()
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseIsPersonalizedFeedModule (copy), config1 (copy)
	local Recommended: string = if UseIsPersonalizedFeedModule() then "recommended" else "trending"
	local UseLocalizationResultEntry = UseLocalizationFunction(config)[Recommended]
	
	return if UseLocalizationResultEntry == nil or UseLocalizationResultEntry == "" then config1[Recommended] else UseLocalizationResultEntry
end