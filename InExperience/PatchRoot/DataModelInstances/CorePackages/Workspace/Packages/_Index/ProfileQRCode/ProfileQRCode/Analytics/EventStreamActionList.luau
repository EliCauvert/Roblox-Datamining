local parent = script:FindFirstAncestor("ProfileQRCode").Parent
local dashModule = require(parent.Dash)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local btnValuesModule = require(script.Parent.Parent.Analytics.BtnValues)
local eventNamesModule = require(script.Parent.EventNames)
local enums = socialLuaAnalyticsModule.Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes

return {
	[eventNamesModule.QRPageLoad] = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.PageLoad,
		formatRulesForAdditionalInfo = { shareLinkId = dashModule.identity }
	},
	[eventNamesModule.QRCodeScannerOpened] = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.QRCodeScannerOpened }
	},
	[eventNamesModule.QRCodeScannerTooltipShown] = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.ProfileQRCodeTooltipShown
	},
	[eventNamesModule.QRPageLoadFailed] = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.PageLoadFailed,
		formatRulesForAdditionalInfo = { errorReason = dashModule.identity }
	},
	[eventNamesModule.QRPageFriendRequestBannerShown] = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.ProfileQRCodeNotificationBannerShown,
		formatRulesForAdditionalInfo = { qrCodeBannerQueueSize = dashModule.identity }
	},
	[eventNamesModule.QRPageFriendRequestBannerAccepted] = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.FriendRequestBannerAccepted },
		formatRulesForAdditionalInfo = { qrCodeBannerQueueSize = dashModule.identity }
	},
	[eventNamesModule.QRPageFriendRequestBannerDismissed] = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.FriendRequestBannerDismissed },
		formatRulesForAdditionalInfo = { qrCodeBannerQueueSize = dashModule.identity }
	},
	[eventNamesModule.RefreshQrSession] = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.RefreshQrSession,
		formatRulesForAdditionalInfo = {
			success = dashModule.identity,
			responseCode = dashModule.identity
		}
	}
}