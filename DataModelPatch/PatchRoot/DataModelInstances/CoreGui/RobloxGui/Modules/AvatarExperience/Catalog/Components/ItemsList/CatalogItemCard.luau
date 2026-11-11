local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local CatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)
local FFlagAXLookAndFeelBackgrounds = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXLookAndFeelBackgrounds
local CatalogItemCardAnimationIndicatorContainerModule = require(script.Parent.CatalogItemCardAnimationIndicatorContainer)
local FFlagAXTestSkeletonInCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXTestSkeletonInCatalog

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ItemCardThumbnail (copy), FFlagAXTestSkeletonInCatalog (copy), CatalogItemCardAnimationIndicatorContainerModule (copy), CatalogItemCard (copy), FFlagAXLookAndFeelBackgrounds (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		AnimationTabs = if p1.animationTabsItemData then ReactModule.createElement(CatalogItemCardAnimationIndicatorContainerModule, {
			ZIndex = 2,
			bundleInfo = p1.animationTabsItemData,
			paddingTop = UDim.new(0, UseTokensResult.Gap.XSmall)
		}) else nil,
		Tile = ReactModule.createElement(CatalogItemCard, {
			ref = Ref,
			onActivated = p1.onActivated,
			onOverlayButtonActivated = p1.onOverlayButtonActivated,
			overlayButtonText = p1.overlayButtonText,
			presentationSlot = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), ReactModule (upval), ItemCardThumbnail (upval), FFlagAXTestSkeletonInCatalog (upval)
				return if p1.thumbnailUrl then ReactModule.createElement(ItemCardThumbnail, {
					ref = p1.thumbnailRef,
					tag = p1.thumbnailTag,
					url = p1.thumbnailUrl,
					onLoaded = p1.onThumbnailLoaded,
					imageRect = p1.thumbnailRect,
					inSkeletonExperiment = FFlagAXTestSkeletonInCatalog
				}) else nil
			end, {
				p1.thumbnailRef, p1.thumbnailTag, p1.inputBindings, p1.thumbnailUrl,
				p1.onThumbnailLoaded, p1.thumbnailRect, UseTokensResult.Radius.Medium
			}),
			priceLineContent = p1.priceLineContent,
			creator = p1.creator,
			title = p1.title,
			itemType = p1.itemType,
			itemInfo = p1.itemInfo,
			itemStatus = p1.itemStatus,
			headerAspectRatio = p1.headerAspectRatio,
			headerSize = p1.headerSize,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			isSelected = p1.isSelected,
			backgroundLayers = if FFlagAXLookAndFeelBackgrounds then p1.backgroundLayers else nil,
			imageScaleType = if FFlagAXLookAndFeelBackgrounds then p1.imageScaleType else nil
		})
	})
end))