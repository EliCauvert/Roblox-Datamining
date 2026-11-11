local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Http.WebApi)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Category, Items)
	return { category = Category, items = Items }
end)