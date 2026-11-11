local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(SocialCarousel.Common.Constants)
local TileModule = require(SocialCarousel.BaseComponents.Tile)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), TileModule (copy)
	return ReactModule.createElement(TileModule, {
		icon = "icons/actions/friend_sort/qr_code",
		index = p1.index,
		itemSize = p1.itemSize,
		onActivated = p1.onActivated,
		title = UseLocalizationFunction({
			shareQRHeading = ConstantsModule.LOCALIZATION.SHARE_QR_HEADING
		}).shareQRHeading,
		selectionOrder = p1.selectionOrder
	})
end