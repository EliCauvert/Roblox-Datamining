local _ = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceCommon)

return function(p1)
	return if p1 == nil or p1.widgetType == nil then nil else {
		widgetId = p1.widgetId,
		widgetType = p1.widgetType,
		widgetItemIds = if p1.widgetItemIds then table.concat(p1.widgetItemIds, ",") else nil,
		requestId = p1.requestId,
		uiTreatmentType = p1.uiTreatmentType
	}
end