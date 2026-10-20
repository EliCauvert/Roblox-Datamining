local Parent = script:FindFirstAncestor("AvatarExperienceFavoritesManager").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

local function onBackActivated() end

local function onSearchActivated() end

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), FoundationModule (copy), onBackActivated (copy), onSearchActivated (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row items-center gap-medium size-full-0 auto-y padding-x-xlarge padding-y-medium bg-surface-0",
		testId = "FavoritesNavBar"
	}, {
		BackButton = ReactModule.createElement(FoundationModule.IconButton, {
			icon = "chevron-large-left",
			tag = "content-emphasis",
			testId = "FavoritesNavBarBackButton",
			onActivated = onBackActivated,
			size = FoundationModule.Enums.InputSize.Medium
		}),
		Title = ReactModule.createElement(FoundationModule.Text, {
			Text = "Favorites",
			tag = "grow auto-y text-title-large text-align-x-center content-emphasis",
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		SearchButton = ReactModule.createElement(FoundationModule.IconButton, {
			tag = "content-emphasis",
			testId = "FavoritesNavBarSearchButton",
			onActivated = onSearchActivated,
			size = FoundationModule.Enums.InputSize.Medium,
			icon = FoundationModule.Enums.IconName.MagnifyingGlass
		})
	})
end)