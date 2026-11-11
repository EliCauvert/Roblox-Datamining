local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local SocialTestHelpersModule = require(ProfileQRCode.Parent.Dev.SocialTestHelpers)
local FindElementWithAssertFunction = SocialTestHelpersModule.TestHelpers.findElementWithAssert
local FindImageSetFunction = SocialTestHelpersModule.TestHelpers.findImageSet
local TextKeysModule = require(ProfileQRCode.Common.TextKeys)

return {
	findQRCodeView = FindElementWithAssertFunction({ Name = "QRCodeView" }),
	findQRCode = FindElementWithAssertFunction({ Name = "QRCode" }),
	findDescription = FindElementWithAssertFunction({ Text = TextKeysModule.ScanQRText }),
	findTrustedConnectionDescription = FindElementWithAssertFunction({ Text = TextKeysModule.TrustedConnectionDescription }),
	findTrustedFriendsDescription = FindElementWithAssertFunction({ Text = TextKeysModule.TrustedFriendsDescription }),
	findTopBarTitle = FindElementWithAssertFunction({ Text = TextKeysModule.Title }),
	findTopBar = FindElementWithAssertFunction({ Name = "TopBar" }),
	findPlayerAvatar = FindElementWithAssertFunction({ Name = "PlayerAvatar" }),
	findCrossButton = FindElementWithAssertFunction(FindImageSetFunction("icons/navigation/close")),
	findBackButton = FindElementWithAssertFunction(FindImageSetFunction("icons/navigation/pushBack")),
	findRetryButton = FindElementWithAssertFunction(FindImageSetFunction("icons/common/refresh")),
	findLoadingElement = FindElementWithAssertFunction({ Name = "Gradient" }),
	findQRCodeIcon = FindElementWithAssertFunction({ Name = "QRImage" }),
	findUsername = FindElementWithAssertFunction({ Name = "Username" }),
	findNotificationDescription = FindElementWithAssertFunction({ Name = "Description" }),
	findCloseButton = FindElementWithAssertFunction({ Name = "CloseButton" }),
	findDismissButton = FindElementWithAssertFunction({ Name = "DismissButton" }),
	findAcceptButton = FindElementWithAssertFunction({ Name = "AcceptButton" }),
	findAlertView = FindElementWithAssertFunction({ Name = "FriendsInvite" }),
	findToastView = FindElementWithAssertFunction({ Name = "FriendAcceptToast" }),
	findFriendAcceptedSnackbar = FindElementWithAssertFunction({ Name = "FriendAcceptedSnackbar" })
}