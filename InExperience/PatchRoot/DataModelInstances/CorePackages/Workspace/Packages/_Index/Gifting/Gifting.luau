local giftAcceptViewModule = require(script.Components.GiftAccept.GiftAcceptView)
local giftAgeCheckContainerModule = require(script.Components.GiftAgeCheck.GiftAgeCheckContainer)
local giftAllowanceViewModule = require(script.Components.GiftAllowance.GiftAllowanceView)
local giftIconButtonViewModule = require(script.Components.GiftIconButton.GiftIconButtonView)
local giftSendViewModule = require(script.Components.GiftSend.GiftSendView)
local giftRobuxBreakdownViewModule = require(script.Components.GiftRobuxBreakdown.GiftRobuxBreakdownView)
local giftSheetLayoutViewModule = require(script.Components.GiftSheetLayout.GiftSheetLayoutView)
local giftStateEnumModule = require(script.Components.GiftState.GiftStateEnum)
local giftStateViewModule = require(script.Components.GiftState.GiftStateView)
local infoTooltipModule = require(script.Components.InfoTooltip.InfoTooltip)
local recipientPickerViewModule = require(script.Components.RecipientPicker.RecipientPickerView)
local giftRejectConfirmationViewModule = require(script.Components.GiftRejectConfirmation.GiftRejectConfirmationView)
local _ = require(script.Types)
local userInfoPanelViewModule = require(script.Components.UserInfoPanel.UserInfoPanelView)
local getFriendDurationModule = require(script.Utils.getFriendDuration)
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
		GiftAcceptView = giftAcceptViewModule,
		GiftAgeCheckContainer = giftAgeCheckContainerModule,
		GiftAllowanceView = giftAllowanceViewModule,
		GiftIconButtonView = giftIconButtonViewModule,
		GiftSendView = giftSendViewModule,
		GiftRobuxBreakdownView = giftRobuxBreakdownViewModule,
		GiftSheetLayoutView = giftSheetLayoutViewModule,
		GiftStateView = giftStateViewModule,
		InfoTooltip = infoTooltipModule,
		RecipientPickerView = recipientPickerViewModule,
		GiftRejectConfirmationView = giftRejectConfirmationViewModule,
		UserInfoPanelView = userInfoPanelViewModule
	},
	Constants = require(script.Constants),
	Hooks = {
		useGiftEligibility = require(script.Hooks.useGiftEligibility),
		useGiftRecipients = require(script.Hooks.useGiftRecipients)
	},
	Utils = { getFriendDuration = getFriendDurationModule },
	Flags = {},
	Enums = {
		GiftState = giftStateEnumModule,
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