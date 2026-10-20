local _ = require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol)

return {
	EconomicRestrictionsPromptCounter = {
		eventName = "InAppEconomicRestrictionPromptShown",
		description = "Counter for tracking the number of times the in-app economic restriction prompt is shown",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2025, 8, 19 }
	},
	UniversalEconomicRestrictionsCounter = {
		eventName = "UniversalEconomicRestrictionPromptShown",
		description = "Counter for tracking the number of times economic restriction prompt is shown for all surfaces",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2025, 8, 25 }
	},
	EconomicRestrictionsSurface = {
		InExperience = "InExperience",
		Gamepass = "Gamepass",
		DeveloperProduct = "DeveloperProduct",
		BulkPurchase = "BulkPurchase",
		AvatarExperience = "AvatarExperience",
		AvatarExperienceLook = "AvatarExperienceLook"
	}
}