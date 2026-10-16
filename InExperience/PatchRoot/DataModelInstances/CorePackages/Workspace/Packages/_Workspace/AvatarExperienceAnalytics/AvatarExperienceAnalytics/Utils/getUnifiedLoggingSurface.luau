local AvatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties

return function(p1) --[[ Line: 9 | Named "getUnifiedLoggingSurface" ]]
	-- upvalues: AvatarScreenProperties (copy)
	local AvatarScreenProperty = if p1 and p1.opaque then AvatarScreenProperties[p1.opaque.name] else nil
	
	return if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
end