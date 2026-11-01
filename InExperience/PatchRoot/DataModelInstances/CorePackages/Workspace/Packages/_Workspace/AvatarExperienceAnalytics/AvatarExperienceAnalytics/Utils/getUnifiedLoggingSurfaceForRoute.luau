local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local UnifiedLoggingSurface = AvatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local GetUnifiedLoggingSurfaceModule = require(script.Parent.getUnifiedLoggingSurface)
local FFlagAXUnifiedEventStrictPayloads = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedEventStrictPayloads

return function(p1)
	-- upvalues: FFlagAXUnifiedEventStrictPayloads (copy), UnifiedLoggingSurface (copy), AvatarScreenProperties (copy), GetUnifiedLoggingSurfaceModule (copy)
	if p1 == nil then
		return if FFlagAXUnifiedEventStrictPayloads then UnifiedLoggingSurface.UNDEFINED_SURFACE else nil
	end
	local Name = if p1.current then p1.current.name else nil
	local AvatarScreenProperty = if Name then AvatarScreenProperties[Name] else nil
	local UnifiedLoggingSurface1 = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
	
	if AvatarScreenProperty and AvatarScreenProperty.isTransparent and UnifiedLoggingSurface1 ~= nil then
		return UnifiedLoggingSurface1
	elseif FFlagAXUnifiedEventStrictPayloads then
		local UnifiedLoggingSurfaceModule = GetUnifiedLoggingSurfaceModule(p1)
		
		return if UnifiedLoggingSurfaceModule == UnifiedLoggingSurface.UNDEFINED_SURFACE then if UnifiedLoggingSurface1 == nil then UnifiedLoggingSurface.UNDEFINED_SURFACE else UnifiedLoggingSurface1 else UnifiedLoggingSurfaceModule
	else
		return GetUnifiedLoggingSurfaceModule(p1) or UnifiedLoggingSurface1
	end
end