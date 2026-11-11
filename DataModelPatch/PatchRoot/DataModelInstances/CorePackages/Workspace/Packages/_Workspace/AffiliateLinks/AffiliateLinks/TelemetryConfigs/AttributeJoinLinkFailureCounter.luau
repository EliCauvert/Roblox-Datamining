local AffiliateLinks = script:FindFirstAncestor("AffiliateLinks")

return {
	eventName = "attributeJoinLinkFailure",
	description = "Counter to track failed Attribute ID generation on Lua Apps.",
	backends = {
		require(AffiliateLinks.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	throttlingPercentage = require(AffiliateLinks.Flags).GetFIntAttributeJoinLinkFailureCounterThrottle(),
	lastUpdated = { 24, 10, 21 }
}