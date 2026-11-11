local ImpressionEnums = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums

return function(p1, p2)
	-- upvalues: ImpressionEnums (copy)
	p1.widgetInteractionV2(p2, ImpressionEnums.ActionType.ITEM_IMPRESSION)
end