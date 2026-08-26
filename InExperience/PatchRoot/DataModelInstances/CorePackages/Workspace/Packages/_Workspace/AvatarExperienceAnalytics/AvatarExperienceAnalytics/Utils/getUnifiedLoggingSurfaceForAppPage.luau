local avatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties

return function(p1)
	-- upvalues: avatarScreenProperties (ref)
	if typeof(p1) ~= "string" or p1 == "" then
		return nil
	end
	local var1 = avatarScreenProperties[p1]
	
	return if var1 and var1.analyticsData then var1.analyticsData.unifiedLoggingSurface else nil
end