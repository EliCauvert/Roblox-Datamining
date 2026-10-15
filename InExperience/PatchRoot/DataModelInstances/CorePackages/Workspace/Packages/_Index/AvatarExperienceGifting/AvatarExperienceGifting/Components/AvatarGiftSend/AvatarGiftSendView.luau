local parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local reactModule = require(parent.React)
local avatarGiftInfoPanelViewModule = require(script.Parent.Parent.AvatarGiftInfoPanel.AvatarGiftInfoPanelView)
local giftSendView = require(parent.Gifting).Components.GiftSendView

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), avatarGiftInfoPanelViewModule (ref), giftSendView (ref)
	local thumbnailUrl = p1.thumbnailUrl
	local itemName = p1.itemName
	local priceText = p1.priceText
	local originalPriceText = p1.originalPriceText
	local pricingNote = p1.pricingNote
	
	return reactModule.createElement(giftSendView, {
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		onBack = p1.onBack,
		allowance = p1.allowance,
		userInfoProps = p1.userInfoProps,
		giftPresentation = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), avatarGiftInfoPanelViewModule (copy), thumbnailUrl (ref), itemName (ref), priceText (ref), originalPriceText (ref), pricingNote (ref)
			return reactModule.createElement(avatarGiftInfoPanelViewModule, {
				thumbnailUrl = thumbnailUrl,
				itemName = itemName,
				priceText = priceText,
				originalPriceText = originalPriceText,
				pricingNote = pricingNote
			})
		end, {
			thumbnailUrl,
			itemName,
			priceText,
			originalPriceText,
			pricingNote
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