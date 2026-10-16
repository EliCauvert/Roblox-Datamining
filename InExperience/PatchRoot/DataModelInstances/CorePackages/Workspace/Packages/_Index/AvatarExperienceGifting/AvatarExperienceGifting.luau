local _ = require(script.Types.GiftSendFlowNavigationOverrides)

return {
	["jest.config"] = script["jest.config"],
	Components = {
		AvatarItemGiftEntryPoint = require(script.Components.AvatarItemGiftEntryPoint.AvatarItemGiftEntryPointContainer),
		AvatarItemGiftRecipientPicker = require(script.Components.AvatarItemGiftRecipientPicker.AvatarItemGiftRecipientPickerContainer),
		AvatarItemGiftReviewSheet = require(script.Components.AvatarItemGiftReviewSheet.AvatarItemGiftReviewSheetContainer)
	},
	Hooks = {
		useAvatarItemGiftEligibility = require(script.Hooks.useAvatarItemGiftEligibility)
	},
	Utils = {}
}