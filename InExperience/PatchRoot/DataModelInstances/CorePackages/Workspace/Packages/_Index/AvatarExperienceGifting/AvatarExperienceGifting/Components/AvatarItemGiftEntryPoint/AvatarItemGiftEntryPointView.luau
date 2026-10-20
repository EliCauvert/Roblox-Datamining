local Parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local ReactModule = require(Parent.React)
local GiftIconButtonView = require(Parent.Gifting).Components.GiftIconButtonView

return function(p1)
	-- upvalues: ReactModule (copy), GiftIconButtonView (copy)
	return if p1.isVisible then ReactModule.createElement(GiftIconButtonView, p1.buttonProps) else nil
end