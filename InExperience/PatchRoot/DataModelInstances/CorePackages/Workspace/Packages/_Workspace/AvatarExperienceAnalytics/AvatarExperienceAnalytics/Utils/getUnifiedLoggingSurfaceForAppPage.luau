local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local _ = require(Parent.RobloxAppEnums)
local _ = require(Parent.UnifiedEventEnums)
local AvatarScreenProperties = require(Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties

return function(p1)
	-- upvalues: AvatarScreenProperties (copy)
	if typeof(p1) == "string" and p1 ~= "" then
		local AvatarScreenProperty = AvatarScreenProperties[p1]
		
		return if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
	else
		return nil
	end
end