local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local InventoryItemsListContainerModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.InventoryItemsListContainer)
local TryOnItemCardContainerModule = require(Modules.AvatarExperience.Photobooth.Components.TryOnItemCard.TryOnItemCardContainer)
local PhotoboothCategoriesModule = require(Modules.AvatarExperience.Photobooth.photoboothCategories)
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = require(Modules.AvatarExperience.Photobooth.Components.Animations.usePhotoboothAnimationsProps)
local PhotoboothAnimationsPillBarModule = require(Modules.AvatarExperience.Photobooth.Components.Animations.PhotoboothAnimationsPillBar)
local FFlagAXPhotoboothBugBashFixes = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXPhotoboothBugBashFixes

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), PhotoboothCategoriesModule (copy), TryOnItemCardContainerModule (copy), FFlagAXPhotoboothBugBashFixes (copy), FoundationModule (copy), PhotoboothAnimationsPillBarModule (copy), InventoryItemsListContainerModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-small size-full-full",
		LayoutOrder = 1,
		Position = p1.position
	}, {
		Heading = ReactModule.createElement(FoundationModule.Text, {
			tag = "text-color-primary text-heading-medium text-align-x-left text-align-y-top auto-xy",
			LayoutOrder = 1,
			Text = UseLocalizationFunction({ animations = "Feature.Avatar.Heading.Animations" }).animations
		}),
		PillBarScrollContainer = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
			PillBar = ReactModule.createElement(PhotoboothAnimationsPillBarModule, {
				tokens = p1.tokens,
				animationFilter = p1.animationFilter,
				onAnimationFilterChanged = p1.onAnimationFilterChanged
			})
		}),
		ScrollViewContainer = ReactModule.createElement(FoundationModule.View, { tag = "grow-1 size-full-0", LayoutOrder = 3 }, {
			ItemsList = ReactModule.createElement(InventoryItemsListContainerModule, {
				showRecommendedItems = false,
				disableSortsAndFilters = true,
				categoryInfo = ReactModule.useMemo(function()
					-- upvalues: PhotoboothCategoriesModule (upval), p1 (copy)
					return PhotoboothCategoriesModule[p1.animationFilter]
				end, { p1.animationFilter }),
				renderItem = ReactModule.useCallback(function(p2, p3)
					-- upvalues: ReactModule (upval), TryOnItemCardContainerModule (upval), FFlagAXPhotoboothBugBashFixes (upval), p1 (copy)
					return ReactModule.createElement(TryOnItemCardContainerModule, {
						inventoryItemType = p2.item.inventoryItemType,
						itemId = p2.item.itemId,
						isSelected = p2.item.itemId ~= nil and p3.ownedItemIdToIsWearing[p2.item.itemId] == true,
						impressionsTag = p3.impressionsTag,
						onTileClicked = if FFlagAXPhotoboothBugBashFixes then p1.onTileClicked else nil
					})
				end, if FFlagAXPhotoboothBugBashFixes then { p1.onTileClicked } else {})
			})
		})
	})
end