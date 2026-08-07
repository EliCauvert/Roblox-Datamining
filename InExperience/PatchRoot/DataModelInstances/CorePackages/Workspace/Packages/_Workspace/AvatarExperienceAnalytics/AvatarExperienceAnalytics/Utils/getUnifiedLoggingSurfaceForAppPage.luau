local avatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties

return function(p0) --[[ line: 21 | named "getUnifiedLoggingSurfaceForAppPage" ]]
	-- upvalues: avatarScreenProperties (ref)
	if typeof(p0) ~= "string" or p0 == "" then
		return nil
	end
	local var0 = avatarScreenProperties[p0]
	
	return if var0 and var0.analyticsData then var0.analyticsData.unifiedLoggingSurface else nil
end