return {
	AccountLockStatusEnum = {
		Locked = "Locked",
		Error = "Error",
		RateLimited = "RateLimited"
	},
	AccountLockEventContextEnum = {
		Init = "accountLockModalInit",
		Unlock = "accountUnlockFlowStart",
		Success = "accountUnlockFlowSuccess",
		Error = "accountUnlockFlowError",
		Abandoned = "accountUnlockFlowAbandoned",
		RateLimited = "accountUnlockFlowRateLimited",
		Logout = "accountLockModalLogout",
		DeepLinkReceived = "accountUnlockDeepLinkReceived",
		DeepLinkMismatch = "accountUnlockDeepLinkMismatch"
	}
}