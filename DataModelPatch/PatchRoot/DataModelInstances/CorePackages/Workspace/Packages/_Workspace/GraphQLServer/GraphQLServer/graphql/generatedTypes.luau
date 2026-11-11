local _ = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill)

return {
	Access = {
		Actionable = "Actionable",
		Denied = "Denied",
		Granted = "Granted",
		Pending = "Pending"
	},
	EventStatus = {
		Active = "active",
		Cancelled = "cancelled",
		Moderated = "moderated",
		Unpublished = "unpublished"
	},
	HostType = { Group = "group", User = "user" },
	MediaAssetType = {
		GamePreviewVideo = "GamePreviewVideo",
		Image = "Image",
		Video = "Video",
		YouTubeVideo = "YouTubeVideo"
	},
	PresenceType = {
		InGame = "InGame",
		InStudio = "InStudio",
		Offline = "Offline",
		Online = "Online"
	},
	RecourseActions = {
		AddedEmail = "AddedEmail",
		Email = "Email",
		GovernmentId = "GovernmentId",
		Phone = "Phone",
		ParentConsent = "ParentConsent",
		ParentLink = "ParentLink",
		Subscription = "Subscription"
	},
	RsvpStatus = {
		Going = "going",
		MaybeGoing = "maybeGoing",
		None = "none",
		NotGoing = "notGoing"
	},
	ShareLinkType = {
		ExperienceDetails = "ExperienceDetails",
		ExperienceInvite = "ExperienceInvite",
		FriendInvite = "FriendInvite",
		Home = "Home",
		NotificationExperienceInvite = "NotificationExperienceInvite",
		PrivateServer = "PrivateServer",
		Profile = "Profile",
		ScreenshotInvite = "ScreenshotInvite",
		Server = "Server"
	},
	VPCRequestTypes = {
		ChargebackReenableAccount = "ChargebackReenableAccount",
		SavePaymentMethods = "SavePaymentMethods",
		UpdateUserSetting = "UpdateUserSetting",
		UpdateBirthdate = "UpdateBirthdate",
		LinkToChild = "LinkToChild",
		ManageFriend = "ManageFriend",
		ManageExperience = "ManageExperience",
		LiftPunishment = "LiftPunishment",
		AddTrustedConnection = "AddTrustedConnection",
		SendTransfer = "SendTransfer",
		ReceiveTransfer = "ReceiveTransfer",
		Unknown = "Unknown"
	}
}