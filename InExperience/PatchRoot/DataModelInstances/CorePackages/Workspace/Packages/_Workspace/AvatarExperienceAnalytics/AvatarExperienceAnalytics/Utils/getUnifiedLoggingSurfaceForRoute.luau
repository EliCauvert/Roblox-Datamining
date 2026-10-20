local AvatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local GetUnifiedLoggingSurfaceModule = require(script.Parent.getUnifiedLoggingSurface)

return function(p1)
	-- upvalues: AvatarScreenProperties (copy), GetUnifiedLoggingSurfaceModule (copy)
	if p1 == nil then
		return nil
	else
		local Name = if p1.current then p1.current.name else nil
		local AvatarScreenProperty = if Name then AvatarScreenProperties[Name] else nil
		local UnifiedLoggingSurface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
		
		return if AvatarScreenProperty and AvatarScreenProperty.isTransparent and UnifiedLoggingSurface ~= nil then UnifiedLoggingSurface else GetUnifiedLoggingSurfaceModule(p1) or UnifiedLoggingSurface
	end
end