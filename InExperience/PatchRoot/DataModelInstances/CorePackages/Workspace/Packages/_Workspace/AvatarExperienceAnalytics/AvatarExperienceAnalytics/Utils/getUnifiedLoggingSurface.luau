local avatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties

return function(p1)
	-- upvalues: avatarScreenProperties (ref)
	local var1 = if p1 and p1.opaque then avatarScreenProperties[p1.opaque.name] else nil
	
	return if var1 and var1.analyticsData then var1.analyticsData.unifiedLoggingSurface else nil
end