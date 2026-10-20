local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local AvatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties

return function(Object, p1)
	-- upvalues: UnifiedEventLogConstantsModule (copy), AvatarScreenProperties (copy)
	if Object:GetAttribute(UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface") ~= nil then
		return nil
	elseif p1 and p1.current and p1.opaque then
		local AvatarScreenProperty = AvatarScreenProperties[p1.opaque.name]
		
		return if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
	else
		return nil
	end
end