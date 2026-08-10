return {
	ActionTypeEnum = {
		Phone = "Phone",
		GovernmentId = "GovernmentId",
		Email = "Email",
		AddedEmail = "AddedEmail",
		ParentConsent = "ParentConsent",
		ParentLink = "ParentLink",
		AgeEstimation = "AgeEstimation",
		Subscription = "Subscription",
		CardVerification = "CardVerification",
		Wait = "Wait",
		UserAgreement = "UserAgreement",
		UserSettings = "UserSettings",
		Invalid = "Invalid"
	},
	AccessResponseEnum = {
		Granted = "Granted",
		Denied = "Denied",
		Actionable = "Actionable",
		Pending = "Pending",
		Error = "Error"
	},
	ActionStatusEnum = {
		Success = "Success",
		Failure = "Failure",
		Cancelled = "Cancelled",
		Unknown = "Unknown",
		RetryRequested = "RetryRequested"
	},
	VPCRequestTypeEnum = {
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
		LiftRestriction = "LiftRestriction",
		Unknown = "Unknown"
	},
	IDVStep = {
		ConnectedMobile = 1,
		Verified = 2,
		GotResults = 3,
		UpdatedRobloxProfile = 4
	},
	VPCStepEnum = {
		Error = 1,
		RequestSent = 2,
		AlreadyLinkedSendRequest = 3,
		NewParentCollectEmail = 4,
		NewParentSendRequest = 5,
		NewParentLoading = 6
	},
	VPCErrorCategoriesEnum = {
		InternalVPCError = "InternalVPCError",
		InvalidEmail = "InvalidEmail",
		Flooded = "Flooded",
		ReceiverFlooded = "ReceiverFlooded",
		SenderFlooded = "SenderFlooded",
		BadUserInput = "BadUserInput",
		UserStateRecoursePathMismatch = "UserStateRecoursePathMismatch",
		SenderFloodedRequestCreated = "SenderFloodedRequestCreated",
		GenericError = "GenericError",
		ConflictingPendingConsent = "ConflictingPendingConsent"
	},
	VPCRetryBehaviorEnum = {
		RetryVPC = "RetryVPC",
		RetryAMP = "RetryAMP",
		NoRetry = "NoRetry",
		Success = "Success"
	},
	UserSettingsSettingNameEnum = { AllowFacialAgeEstimation = "allowFacialAgeEstimation" },
	VPCErrorCodesEnum = {
		InvalidEmailAddress = "InvalidEmailAddress",
		EmailNotUnique = "EmailNotUnique",
		LinkingIneligible = "LinkingIneligible",
		ParentAtLinkLimit = "ParentAtLinkLimit",
		SenderFlooded = "SenderFlooded",
		ReceiverFlooded = "ReceiverFlooded",
		InvalidParameter = "InvalidParameter",
		UpdateUserSettingRequestInvalid = "UpdateUserSettingRequestInvalid",
		AlreadyLinked = "AlreadyLinked",
		ChildAtLinkLimit = "ChildAtLinkLimit",
		NoLinkedParents = "NoLinkedParents",
		SenderFloodedRequestCreated = "SenderFloodedRequestCreated",
		Unknown = "Unknown",
		ServiceUnavailable = "ServiceUnavailable",
		IllegalState = "IllegalState",
		InvalidUserID = "InvalidUserID",
		ConsentAlreadyApplied = "ConsentAlreadyApplied",
		ConsentAlreadyRequestedConflictingData = "ConsentAlreadyRequestedConflictingData",
		ReceiverNotWhitelisted = "ReceiverNotWhitelisted",
		InvalidComplianceFeature = "InvalidComplianceFeature",
		ChildTooOld = "ChildTooOld",
		UserForgotten = "UserForgotten",
		UnsupportedNotificationType = "UnsupportedNotificationType",
		UnsupportedRequestType = "UnsupportedRequestType",
		ChildIneligibleForConsent = "ChildIneligibleForConsent"
	}
}