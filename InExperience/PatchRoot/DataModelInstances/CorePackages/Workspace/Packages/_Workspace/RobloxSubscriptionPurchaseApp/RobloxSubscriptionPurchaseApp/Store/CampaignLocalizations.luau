local SessionScopedSignal, SessionScopedSignal2 = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.SignalsUtils).createSessionScopedSignal({})

return {
	getCampaignLocalizations = SessionScopedSignal,
	setCampaignLocalizations = SessionScopedSignal2
}