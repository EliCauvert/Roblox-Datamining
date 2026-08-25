local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local unifiedLoggingSurface = require(avatarExperienceAnalytics.Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local marketplaceSurfaceType = require(avatarExperienceAnalytics.Enums.ImpressionEnums).MarketplaceSurfaceType
local t = {
	[marketplaceSurfaceType.HOMEPAGE] = unifiedLoggingSurface.CATALOG,
	[marketplaceSurfaceType.SEARCH] = unifiedLoggingSurface.SEARCH_RESULTS,
	[marketplaceSurfaceType.ITEM_DETAIL] = unifiedLoggingSurface.ITEM_DETAILS,
	[marketplaceSurfaceType.COMMUNITY_PROFILE] = unifiedLoggingSurface.COMMUNITY_PROFILE,
	[marketplaceSurfaceType.USER_PROFILE] = unifiedLoggingSurface.USER_PROFILE,
	[marketplaceSurfaceType.DISCOVERY_HOMEPAGE] = unifiedLoggingSurface.DISCOVERY_HOMEPAGE,
	[marketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS] = unifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS
}
local t_1 = {}

for i, v in marketplaceSurfaceType do
	t_1[v] = true
end
local t_2 = {}

for i_1, v_1 in unifiedLoggingSurface do
	if not t_1[v_1] then
		t_2[v_1] = true
	end
end
return function(p0)
	-- upvalues: t (ref), t_2 (ref)
	if p0 == nil then
		return nil
	end
	local var4 = t[p0]
	
	return if var4 == nil then if t_2[p0] then p0 else nil else var4
end