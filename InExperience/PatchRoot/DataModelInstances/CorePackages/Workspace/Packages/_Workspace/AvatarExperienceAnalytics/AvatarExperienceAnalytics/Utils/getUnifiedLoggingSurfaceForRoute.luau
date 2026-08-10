local avatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local getUnifiedLoggingSurfaceModule = require(script.Parent.getUnifiedLoggingSurface)

return function(p0) --[[ line: 29 | named "getUnifiedLoggingSurfaceForRoute" ]]
	-- upvalues: avatarScreenProperties (ref), getUnifiedLoggingSurfaceModule (ref)
	if p0 == nil then
		return nil
	end
	local var1 = if p0.current then p0.current.name else nil
	local var2 = if var1 then avatarScreenProperties[var1] else nil
	local var3 = if var2 and var2.analyticsData then var2.analyticsData.unifiedLoggingSurface else nil
	
	return if var2 and var2.isTransparent and var3 ~= nil then var3 else getUnifiedLoggingSurfaceModule(p0) or var3
end