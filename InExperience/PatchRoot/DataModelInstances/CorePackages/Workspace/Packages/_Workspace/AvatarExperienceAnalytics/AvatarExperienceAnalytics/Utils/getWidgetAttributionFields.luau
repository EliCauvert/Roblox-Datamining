local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local _ = require(AvatarExperienceAnalytics.Parent.AvatarExperienceCommon)
local _ = require(AvatarExperienceAnalytics.Generated.UnifiedEventTypes)

return function(p1)
	return if p1 == nil or p1.widgetType == nil then nil else {
		widgetId = p1.widgetId,
		widgetType = p1.widgetType,
		widgetItemIds = if p1.widgetItemIds then table.concat(p1.widgetItemIds, ",") else nil,
		requestId = p1.requestId,
		uiTreatmentType = p1.uiTreatmentType
	}
end