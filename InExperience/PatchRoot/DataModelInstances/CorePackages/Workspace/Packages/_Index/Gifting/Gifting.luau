local _ = require(script.Types)
local _ = require(script.Models.CanGiftResponseModel)
local _ = require(script.Models.GiftErrorModel)
local _ = require(script.Models.FindRecipientsResponseModel)
local _ = require(script.Models.PendingGiftsResponseModel)
local _ = require(script.Models.PrepareGiftResponseModel)
local _ = require(script.Models.ReceiverPreviewResponseModel)
local _ = require(script.Stores.createCanGiftStore)

return {
	["jest.config"] = script["jest.config"],
	Components = {
		GiftAcceptView = require(script.Components.GiftAccept.GiftAcceptView),
		GiftAgeCheckContainer = require(script.Components.GiftAgeCheck.GiftAgeCheckContainer),
		GiftAllowanceView = require(script.Components.GiftAllowance.GiftAllowanceView),
		GiftIconButtonView = require(script.Components.GiftIconButton.GiftIconButtonView),
		GiftSendView = require(script.Components.GiftSend.GiftSendView),
		GiftRobuxBreakdownView = require(script.Components.GiftRobuxBreakdown.GiftRobuxBreakdownView),
		GiftSheetLayoutView = require(script.Components.GiftSheetLayout.GiftSheetLayoutView),
		GiftStateView = require(script.Components.GiftState.GiftStateView),
		InfoTooltip = require(script.Components.InfoTooltip.InfoTooltip),
		RecipientPickerView = require(script.Components.RecipientPicker.RecipientPickerView),
		GiftRejectConfirmationView = require(script.Components.GiftRejectConfirmation.GiftRejectConfirmationView),
		UserInfoPanelView = require(script.Components.UserInfoPanel.UserInfoPanelView)
	},
	Constants = require(script.Constants),
	Hooks = {
		useGiftEligibility = require(script.Hooks.useGiftEligibility),
		useGiftRecipients = require(script.Hooks.useGiftRecipients)
	},
	Utils = {
		getFriendDuration = require(script.Utils.getFriendDuration)
	},
	Flags = {},
	Enums = {
		GiftState = require(script.Components.GiftState.GiftStateEnum),
		ItemType = require(script.Enums.ItemType),
		GiftEligibility = require(script.Enums.GiftEligibility),
		RequiredAction = require(script.Enums.RequiredAction),
		UserRelationship = require(script.Enums.UserRelationship),
		FailureReason = require(script.Enums.FailureReason),
		AmpRecourseAction = require(script.Enums.AmpRecourseAction)
	},
	WebApi = {
		Urls = require(script.WebApi.Urls),
		postCanGift = require(script.WebApi.postCanGift),
		postFindRecipients = require(script.WebApi.postFindRecipients),
		postPrepareGift = require(script.WebApi.postPrepareGift),
		postPurchaseGift = require(script.WebApi.postPurchaseGift),
		postAcceptGift = require(script.WebApi.postAcceptGift),
		postRejectGift = require(script.WebApi.postRejectGift),
		getPendingGifts = require(script.WebApi.getPendingGifts),
		getReceiverPreview = require(script.WebApi.getReceiverPreview)
	},
	Stores = { getCanGiftStore = require(script.Stores.getCanGiftStore) }
}