local avatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local getUnifiedLoggingSurfaceModule = require(script.Parent.getUnifiedLoggingSurface)

return function(p1)
	-- upvalues: avatarScreenProperties (ref), getUnifiedLoggingSurfaceModule (ref)
	if p1 == nil then
		return nil
	end
	local var1 = if p1.current then p1.current.name else nil
	local var2 = if var1 then avatarScreenProperties[var1] else nil
	local var3 = if var2 and var2.analyticsData then var2.analyticsData.unifiedLoggingSurface else nil
	
	return if var2 and var2.isTransparent and var3 ~= nil then var3 else getUnifiedLoggingSurfaceModule(p1) or var3
end