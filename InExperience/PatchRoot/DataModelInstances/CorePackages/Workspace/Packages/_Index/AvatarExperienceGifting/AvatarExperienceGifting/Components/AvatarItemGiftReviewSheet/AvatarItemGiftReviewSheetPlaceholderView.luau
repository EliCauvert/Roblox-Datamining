local parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local reactModule = require(parent.React)
local giftSheetLayoutView = require(parent.Gifting).Components.GiftSheetLayoutView

return function(p1)
	-- upvalues: reactModule (ref), giftSheetLayoutView (ref)
	return if p1.isVisible then reactModule.createElement(giftSheetLayoutView, {
		isOpen = true,
		titleText = "Purchase prompt",
		content = nil,
		onBack = p1.onBack,
		onClose = p1.onClose
	}) else nil
end