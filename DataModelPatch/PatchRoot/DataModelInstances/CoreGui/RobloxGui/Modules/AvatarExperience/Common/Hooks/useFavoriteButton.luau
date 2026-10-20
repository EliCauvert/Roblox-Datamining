local CorePackages = game:GetService("CorePackages")
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local IconsActionsFavoriteOff = Images["icons/actions/favoriteOff"]
local IconsActionsFavoriteOn = Images["icons/actions/favoriteOn"]

return function(_, p1, OnActivated)
	-- upvalues: UseLocalizationFunction (copy), IconsActionsFavoriteOn (copy), IconsActionsFavoriteOff (copy)
	return {
		icon = if p1 then IconsActionsFavoriteOn else IconsActionsFavoriteOff,
		text = UseLocalizationFunction({ favoriteAction = "Feature.Favorites.Label.Favorite" }).favoriteAction,
		onActivated = OnActivated
	}
end