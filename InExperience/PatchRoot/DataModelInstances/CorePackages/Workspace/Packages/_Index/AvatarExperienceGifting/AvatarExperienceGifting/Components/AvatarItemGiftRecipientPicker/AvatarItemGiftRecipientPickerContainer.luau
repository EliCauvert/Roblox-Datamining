local AvatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local ReactModule = require(AvatarExperienceGifting.Parent.React)
local _ = require(AvatarExperienceGifting.Types.GiftSendFlowNavigationOverrides)
local AvatarItemGiftRecipientPickerViewModule = require(script.Parent.AvatarItemGiftRecipientPickerView)
local UseAvatarItemGiftRecipientPickerViewModelModule = require(script.Parent.useAvatarItemGiftRecipientPickerViewModel)

return function(p1) --[[ Line: 14 | Named "AvatarItemGiftRecipientPickerContainer" ]]
	-- upvalues: UseAvatarItemGiftRecipientPickerViewModelModule (copy), ReactModule (copy), AvatarItemGiftRecipientPickerViewModule (copy)
	return ReactModule.createElement(AvatarItemGiftRecipientPickerViewModule, (UseAvatarItemGiftRecipientPickerViewModelModule(p1.navigationOverrides)))
end