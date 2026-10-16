local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local UnifiedLoggingSurface = require(AvatarExperienceAnalytics.Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local MarketplaceSurfaceType = require(AvatarExperienceAnalytics.Enums.ImpressionEnums).MarketplaceSurfaceType
local config = {
	[MarketplaceSurfaceType.HOMEPAGE] = UnifiedLoggingSurface.CATALOG,
	[MarketplaceSurfaceType.SEARCH] = UnifiedLoggingSurface.SEARCH_RESULTS,
	[MarketplaceSurfaceType.ITEM_DETAIL] = UnifiedLoggingSurface.ITEM_DETAILS,
	[MarketplaceSurfaceType.COMMUNITY_PROFILE] = UnifiedLoggingSurface.COMMUNITY_PROFILE,
	[MarketplaceSurfaceType.USER_PROFILE] = UnifiedLoggingSurface.USER_PROFILE,
	[MarketplaceSurfaceType.DISCOVERY_HOMEPAGE] = UnifiedLoggingSurface.DISCOVERY_HOMEPAGE,
	[MarketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS] = UnifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS
}
local t = {}

for _, value in MarketplaceSurfaceType do
	t[value] = true
end
local t1 = {}

for _, value1 in UnifiedLoggingSurface do
	if not t[value1] then
		t1[value1] = true
	end
end
return function(p1) --[[ Line: 51 | Named "mapMarketplaceSurfaceToUnifiedLoggingSurface" ]]
	-- upvalues: config (copy), t1 (copy)
	if p1 == nil then
		return nil
	else
		local Entry = config[p1]
		
		return if Entry == nil then if t1[p1] then p1 else nil else Entry
	end
end