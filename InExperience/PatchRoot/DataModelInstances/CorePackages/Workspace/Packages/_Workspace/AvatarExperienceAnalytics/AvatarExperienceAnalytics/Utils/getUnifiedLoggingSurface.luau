local avatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties

return function(p0) --[[ line: 9 | named "getUnifiedLoggingSurface" ]]
	-- upvalues: avatarScreenProperties (ref)
	local var0 = if p0 and p0.opaque then avatarScreenProperties[p0.opaque.name] else nil
	
	return if var0 and var0.analyticsData then var0.analyticsData.unifiedLoggingSurface else nil
end