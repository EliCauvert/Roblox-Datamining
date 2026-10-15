local parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local reactModule = require(parent.React)
local giftIconButtonView = require(parent.Gifting).Components.GiftIconButtonView

return function(p1)
	-- upvalues: reactModule (ref), giftIconButtonView (ref)
	return if p1.isVisible then reactModule.createElement(giftIconButtonView, p1.buttonProps) else nil
end