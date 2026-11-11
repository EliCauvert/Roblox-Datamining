local Parent = script:FindFirstAncestor("AvatarExperienceFavoritesManager").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full bg-surface-0",
		testId = "FavoritesSavedView"
	})
end)