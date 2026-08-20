local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceRodux)

return function(p0) --[[ line: 17 | named "selectHydratedWidgetData" ]]
	return p0 and (p0.AvatarExperience and (p0.AvatarExperience.Common and (p0.AvatarExperience.Common.Widgets and p0.AvatarExperience.Common.Widgets.HydratedWidgetData)))
end