local Parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local ReactModule = require(Parent.React)
local AvatarGiftInfoPanelViewModule = require(script.Parent.Parent.AvatarGiftInfoPanel.AvatarGiftInfoPanelView)
local GiftAcceptView = require(Parent.Gifting).Components.GiftAcceptView
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return ReactModule.memo(function(p1) --[[ Line: 22 | Named "AvatarGiftAcceptView" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), AvatarGiftInfoPanelViewModule (copy), GiftAcceptView (copy)
	local ThumbnailUrl = p1.thumbnailUrl
	local ItemName = p1.itemName
	local CaptionText = p1.captionText
	local Size2000 = UseTokensFunction().Size.Size_2000
	
	return ReactModule.createElement(GiftAcceptView, {
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		userInfoProps = p1.userInfoProps,
		giftPresentation = ReactModule.useMemo(function() --[[ Line: 30 ]]
			-- upvalues: ReactModule (upval), AvatarGiftInfoPanelViewModule (upval), ThumbnailUrl (copy), ItemName (copy), CaptionText (copy), Size2000 (copy)
			return ReactModule.createElement(AvatarGiftInfoPanelViewModule, {
				thumbnailUrl = ThumbnailUrl,
				itemName = ItemName,
				captionText = CaptionText,
				thumbnailSize = Size2000
			})
		end, { ThumbnailUrl, ItemName, CaptionText, Size2000 }),
		state = p1.state,
		acceptLabel = p1.acceptLabel,
		isAcceptLoading = p1.isAcceptLoading,
		isAcceptDisabled = p1.isAcceptDisabled,
		onAccept = p1.onAccept,
		rejectLabel = p1.rejectLabel,
		isRejectLoading = p1.isRejectLoading,
		isRejectDisabled = p1.isRejectDisabled,
		onReject = p1.onReject,
		disclaimerText = p1.disclaimerText,
		onClose = p1.onClose
	})
end)