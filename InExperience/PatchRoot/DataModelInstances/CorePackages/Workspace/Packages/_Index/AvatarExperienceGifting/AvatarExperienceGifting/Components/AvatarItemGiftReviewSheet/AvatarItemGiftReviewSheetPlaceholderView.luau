local Parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local ReactModule = require(Parent.React)
local GiftSheetLayoutView = require(Parent.Gifting).Components.GiftSheetLayoutView

return function(p1)
	-- upvalues: ReactModule (copy), GiftSheetLayoutView (copy)
	return if p1.isVisible then ReactModule.createElement(GiftSheetLayoutView, {
		isOpen = true,
		titleText = "Purchase prompt",
		content = nil,
		onBack = p1.onBack,
		onClose = p1.onClose
	}) else nil
end