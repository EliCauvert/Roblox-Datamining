local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local avatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties

return function(p1, p2)
	-- upvalues: unifiedEventLogConstantsModule (ref), avatarScreenProperties (ref)
	if p1:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface") ~= nil then
		return nil
	elseif not p2 or not p2.current or not p2.opaque then
		return nil
	end
	local name = avatarScreenProperties[p2.opaque.name]
	
	return if name and name.analyticsData then name.analyticsData.unifiedLoggingSurface else nil
end