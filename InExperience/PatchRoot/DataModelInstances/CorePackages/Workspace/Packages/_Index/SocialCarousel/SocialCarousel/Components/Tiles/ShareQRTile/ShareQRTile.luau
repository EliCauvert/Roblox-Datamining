local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(socialCarousel.Common.Constants)
local tileModule = require(socialCarousel.BaseComponents.Tile)

return function(p1)
	-- upvalues: useLocalization (ref), constantsModule (ref), reactModule (ref), tileModule (ref)
	return reactModule.createElement(tileModule, {
		icon = "icons/actions/friend_sort/qr_code",
		index = p1.index,
		itemSize = p1.itemSize,
		onActivated = p1.onActivated,
		title = useLocalization({
			shareQRHeading = constantsModule.LOCALIZATION.SHARE_QR_HEADING
		}).shareQRHeading,
		selectionOrder = p1.selectionOrder
	})
end