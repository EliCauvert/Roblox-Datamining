local Parent = script:FindFirstAncestor("AvatarExperienceGifting").Parent
local ReactModule = require(Parent.React)
local RecipientPickerView = require(Parent.Gifting).Components.RecipientPickerView

return function(p1) --[[ Line: 14 | Named "AvatarItemGiftRecipientPickerView" ]]
	-- upvalues: ReactModule (copy), RecipientPickerView (copy)
	return if p1.isVisible then ReactModule.createElement(RecipientPickerView, p1.pickerProps) else nil
end