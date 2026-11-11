local Parent = script:FindFirstAncestor("ProfileQRCode").Parent
local DashModule = require(Parent.Dash)
local BtnValuesModule = require(script.Parent.Parent.Analytics.BtnValues)
local EventNamesModule = require(script.Parent.EventNames)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes

return {
	[EventNamesModule.QRPageLoad] = {
		context = Contexts.ProfileQRCode,
		eventType = EventTypes.PageLoad,
		formatRulesForAdditionalInfo = { shareLinkId = DashModule.identity }
	},
	[EventNamesModule.QRCodeScannerOpened] = {
		context = Contexts.ProfileQRCode,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.QRCodeScannerOpened }
	},
	[EventNamesModule.QRCodeScannerTooltipShown] = {
		context = Contexts.ProfileQRCode,
		eventType = EventTypes.ProfileQRCodeTooltipShown
	},
	[EventNamesModule.QRPageLoadFailed] = {
		context = Contexts.ProfileQRCode,
		eventType = EventTypes.PageLoadFailed,
		formatRulesForAdditionalInfo = { errorReason = DashModule.identity }
	},
	[EventNamesModule.QRPageFriendRequestBannerShown] = {
		context = Contexts.ProfileQRCode,
		eventType = EventTypes.ProfileQRCodeNotificationBannerShown,
		formatRulesForAdditionalInfo = { qrCodeBannerQueueSize = DashModule.identity }
	},
	[EventNamesModule.QRPageFriendRequestBannerAccepted] = {
		context = Contexts.ProfileQRCode,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.FriendRequestBannerAccepted },
		formatRulesForAdditionalInfo = { qrCodeBannerQueueSize = DashModule.identity }
	},
	[EventNamesModule.QRPageFriendRequestBannerDismissed] = {
		context = Contexts.ProfileQRCode,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.FriendRequestBannerDismissed },
		formatRulesForAdditionalInfo = { qrCodeBannerQueueSize = DashModule.identity }
	},
	[EventNamesModule.RefreshQrSession] = {
		context = Contexts.ProfileQRCode,
		eventType = EventTypes.RefreshQrSession,
		formatRulesForAdditionalInfo = {
			success = DashModule.identity,
			responseCode = DashModule.identity
		}
	}
}