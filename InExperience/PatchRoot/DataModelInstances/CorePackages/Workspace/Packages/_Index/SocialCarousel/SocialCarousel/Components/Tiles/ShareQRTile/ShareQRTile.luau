local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local FFlagSocialCarouselXXSmallTilesModule = require(SocialCarousel.Flags.FFlagSocialCarouselXXSmallTiles)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(SocialCarousel.Common.Constants)
local TileModule = require(SocialCarousel.BaseComponents.Tile)

return function(p1)
	-- upvalues: FFlagSocialCarouselXXSmallTilesModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), TileModule (copy)
	local IsIsCompact: boolean = FFlagSocialCarouselXXSmallTilesModule and p1.isCompact == true
	
	return ReactModule.createElement(TileModule, {
		testId = p1.testId or `--social-social-carousel-view-share-qr-{p0.index}`,
		index = p1.index,
		itemSize = p1.itemSize,
		onActivated = p1.onActivated,
		title = UseLocalizationFunction({
			shareQRHeading = ConstantsModule.LOCALIZATION.SHARE_QR_HEADING
		}).shareQRHeading,
		icon = if IsIsCompact then "squares-grid-qr" else "icons/actions/friend_sort/qr_code",
		iconScale = if IsIsCompact then ConstantsModule.TILE_ICON_SCALE else nil,
		selectionOrder = p1.selectionOrder
	})
end