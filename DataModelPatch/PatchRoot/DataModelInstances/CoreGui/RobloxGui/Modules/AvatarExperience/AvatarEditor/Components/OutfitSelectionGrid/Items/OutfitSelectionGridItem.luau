local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local CatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), CatalogItemCard (copy), FoundationModule (copy), ItemCardThumbnail (copy)
	return ReactModule.createElement(CatalogItemCard, {
		Selectable = true,
		Size = UDim2.fromScale(1, 1),
		AutomaticSize = Enum.AutomaticSize.Y,
		isSelected = p1.isSelected,
		onActivated = p1.onActivated,
		title = p1.title,
		ref = p1.focusNavigationRef,
		presentationSlot = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full radius-medium clip",
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, {
			Thumbnail = if p1.thumbnail then ReactModule.createElement(ItemCardThumbnail, { url = p1.thumbnail }) else nil
		})
	})
end)