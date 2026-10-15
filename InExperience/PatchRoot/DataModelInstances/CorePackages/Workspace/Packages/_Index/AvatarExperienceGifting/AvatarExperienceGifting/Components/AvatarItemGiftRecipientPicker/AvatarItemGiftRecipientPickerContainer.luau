local avatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local reactModule = require(avatarExperienceGifting.Parent.React)
local _ = require(avatarExperienceGifting.Types.GiftSendFlowNavigationOverrides)
local avatarItemGiftRecipientPickerViewModule = require(script.Parent.AvatarItemGiftRecipientPickerView)
local useAvatarItemGiftRecipientPickerViewModelModule = require(script.Parent.useAvatarItemGiftRecipientPickerViewModel)

return function(p1)
	-- upvalues: useAvatarItemGiftRecipientPickerViewModelModule (ref), reactModule (ref), avatarItemGiftRecipientPickerViewModule (ref)
	return reactModule.createElement(avatarItemGiftRecipientPickerViewModule, useAvatarItemGiftRecipientPickerViewModelModule(p1.navigationOverrides))
end