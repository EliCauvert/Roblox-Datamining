local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceRodux)

return function(p1)
	return p1 and (p1.AvatarExperience and (p1.AvatarExperience.Common and (p1.AvatarExperience.Common.Widgets and p1.AvatarExperience.Common.Widgets.HydratedWidgetData)))
end