local Parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local ReactModule = require(Parent.React)
local AvatarGiftInfoPanelViewModule = require(script.Parent.Parent.AvatarGiftInfoPanel.AvatarGiftInfoPanelView)
local GiftSendView = require(Parent.Gifting).Components.GiftSendView

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), AvatarGiftInfoPanelViewModule (copy), GiftSendView (copy)
	local ThumbnailUrl = p1.thumbnailUrl
	local ItemName = p1.itemName
	local PriceText = p1.priceText
	local OriginalPriceText = p1.originalPriceText
	local PricingNote = p1.pricingNote
	
	return ReactModule.createElement(GiftSendView, {
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		onBack = p1.onBack,
		allowance = p1.allowance,
		userInfoProps = p1.userInfoProps,
		giftPresentation = ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), AvatarGiftInfoPanelViewModule (upval), ThumbnailUrl (copy), ItemName (copy), PriceText (copy), OriginalPriceText (copy), PricingNote (copy)
			return ReactModule.createElement(AvatarGiftInfoPanelViewModule, {
				thumbnailUrl = ThumbnailUrl,
				itemName = ItemName,
				priceText = PriceText,
				originalPriceText = OriginalPriceText,
				pricingNote = PricingNote
			})
		end, {
			ThumbnailUrl,
			ItemName,
			PriceText,
			OriginalPriceText,
			PricingNote
		}),
		savingsPresentation = p1.savingsPresentation,
		state = p1.state,
		buyLabel = p1.buyLabel,
		isBuyLoading = p1.isBuyLoading,
		isBuyDisabled = p1.isBuyDisabled,
		onBuy = p1.onBuy,
		disclaimerText = p1.disclaimerText,
		onClose = p1.onClose
	})
end)