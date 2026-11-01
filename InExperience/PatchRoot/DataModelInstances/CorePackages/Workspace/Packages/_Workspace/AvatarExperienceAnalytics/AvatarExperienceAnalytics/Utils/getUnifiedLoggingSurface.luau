local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local UnifiedLoggingSurface = AvatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local FFlagAXUnifiedEventStrictPayloads = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedEventStrictPayloads

return function(p1)
	-- upvalues: AvatarScreenProperties (copy), FFlagAXUnifiedEventStrictPayloads (copy), UnifiedLoggingSurface (copy)
	local AvatarScreenProperty = if p1 and p1.opaque then AvatarScreenProperties[p1.opaque.name] else nil
	local UnifiedLoggingSurface1 = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
	
	if not UnifiedLoggingSurface1 then
		if FFlagAXUnifiedEventStrictPayloads then
			return UnifiedLoggingSurface.UNDEFINED_SURFACE
		end
		UnifiedLoggingSurface1 = nil
	end
	return UnifiedLoggingSurface1
end