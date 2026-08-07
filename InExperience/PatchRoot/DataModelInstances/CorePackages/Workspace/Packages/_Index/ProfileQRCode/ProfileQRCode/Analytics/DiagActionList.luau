local eventNamesModule = require(script.Parent.EventNames)

return {
	[eventNamesModule.QRPageLoad] = {
		name = game:DefineFastString("ProfileQRPageLoad", "ProfileQRPageLoad")
	},
	[eventNamesModule.QRCodeScannerOpened] = {
		name = game:DefineFastString("ProfileQRCodeScannerOpened", "ProfileQRCodeScannerOpened")
	},
	[eventNamesModule.QRCodeScannerTooltipShown] = {
		name = game:DefineFastString("ProfileQRCodeScannerTooltipShown", "ProfileQRCodeScannerTooltipShown")
	},
	[eventNamesModule.QRPageLoadFailed] = {
		name = game:DefineFastString("ProfileQRPageLoadFailed", "ProfileQRPageLoadFailed")
	},
	[eventNamesModule.QRPageFriendRequestBannerShown] = {
		name = game:DefineFastString("ProfileQRPageFriendRequestBannerShown", "ProfileQRPageFriendRequestBannerShown")
	},
	[eventNamesModule.QRPageFriendRequestBannerAccepted] = {
		name = game:DefineFastString("ProfileQRPageFriendRequestBannerAccepted", "ProfileQRPageFriendRequestBannerAccepted")
	},
	[eventNamesModule.QRPageFriendRequestBannerDismissed] = {
		name = game:DefineFastString("ProfileQRPageFriendRequestBannerDismissed", "ProfileQRPageFriendRequestBannerDismissed")
	}
}