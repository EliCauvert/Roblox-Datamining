local parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarGiftInfoPanelViewModule = require(script.Parent.Parent.AvatarGiftInfoPanel.AvatarGiftInfoPanelView)
local giftAcceptView = require(parent.Gifting).Components.GiftAcceptView
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), avatarGiftInfoPanelViewModule (ref), giftAcceptView (ref)
	local var1 = useTokens()
	local thumbnailUrl = p1.thumbnailUrl
	local itemName = p1.itemName
	local captionText = p1.captionText
	local size2000 = var1.Size.Size_2000
	
	return reactModule.createElement(giftAcceptView, {
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		userInfoProps = p1.userInfoProps,
		giftPresentation = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), avatarGiftInfoPanelViewModule (copy), thumbnailUrl (ref), itemName (ref), captionText (ref), size2000 (ref)
			return reactModule.createElement(avatarGiftInfoPanelViewModule, {
				thumbnailUrl = thumbnailUrl,
				itemName = itemName,
				captionText = captionText,
				thumbnailSize = size2000
			})
		end, { thumbnailUrl, itemName, captionText, size2000 }),
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