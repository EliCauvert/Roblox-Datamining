return {
	isRobloxSubscriptionReadSupported = function()
		return game:GetEngineFeature("ReadHasRobloxSubscriptionLua")
	end,
	isFirstTimePurchaseConsentStorageSupported = function()
		return game:GetEngineFeature("FirstTimePurchaseConsentAcknowledgedStorageKey")
	end
}