local parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local reactModule = require(parent.React)
local recipientPickerView = require(parent.Gifting).Components.RecipientPickerView

return function(p1)
	-- upvalues: reactModule (ref), recipientPickerView (ref)
	return if p1.isVisible then reactModule.createElement(recipientPickerView, p1.pickerProps) else nil
end