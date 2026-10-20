local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.QRPageLoad] = {
		name = game:DefineFastString("ProfileQRPageLoad", "ProfileQRPageLoad")
	},
	[EventNamesModule.QRCodeScannerOpened] = {
		name = game:DefineFastString("ProfileQRCodeScannerOpened", "ProfileQRCodeScannerOpened")
	},
	[EventNamesModule.QRCodeScannerTooltipShown] = {
		name = game:DefineFastString("ProfileQRCodeScannerTooltipShown", "ProfileQRCodeScannerTooltipShown")
	},
	[EventNamesModule.QRPageLoadFailed] = {
		name = game:DefineFastString("ProfileQRPageLoadFailed", "ProfileQRPageLoadFailed")
	},
	[EventNamesModule.QRPageFriendRequestBannerShown] = {
		name = game:DefineFastString("ProfileQRPageFriendRequestBannerShown", "ProfileQRPageFriendRequestBannerShown")
	},
	[EventNamesModule.QRPageFriendRequestBannerAccepted] = {
		name = game:DefineFastString("ProfileQRPageFriendRequestBannerAccepted", "ProfileQRPageFriendRequestBannerAccepted")
	},
	[EventNamesModule.QRPageFriendRequestBannerDismissed] = {
		name = game:DefineFastString("ProfileQRPageFriendRequestBannerDismissed", "ProfileQRPageFriendRequestBannerDismissed")
	}
}