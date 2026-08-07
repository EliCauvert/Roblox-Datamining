local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local avatarScreenProperties = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties

return function(p0, p1) --[[ line: 10 | named "resolveClickSurface" ]]
	-- upvalues: unifiedEventLogConstantsModule (ref), avatarScreenProperties (ref)
	if p0:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface") ~= nil then
		return nil
	elseif not p1 or not p1.current or not p1.opaque then
		return nil
	end
	local name = avatarScreenProperties[p1.opaque.name]
	
	return if name and name.analyticsData then name.analyticsData.unifiedLoggingSurface else nil
end