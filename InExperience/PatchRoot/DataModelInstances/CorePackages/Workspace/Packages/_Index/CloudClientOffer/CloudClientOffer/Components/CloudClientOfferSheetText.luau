local CloudClientOffer = script:FindFirstAncestor("CloudClientOffer")
local _ = require(CloudClientOffer.createCloudClientOffer)
local FStringLuaAppCloudClientRobloxRealityNameModule = require(CloudClientOffer.Flags.FStringLuaAppCloudClientRobloxRealityName)

return {
	RobloxReality = {
		title = {
			"Feature.CloudClient.Heading.RobloxRealityOffer",
			productName = FStringLuaAppCloudClientRobloxRealityNameModule
		},
		body = {
			"Feature.CloudClient.Description.RobloxRealityOffer",
			productName = FStringLuaAppCloudClientRobloxRealityNameModule
		},
		features = {
			{
				"Feature.CloudClient.Label.RobloxRealityDemoLength",
				minutes = require(CloudClientOffer.Flags.FIntLuaAppCloudClientRobloxRealityDemoMinutes)
			},
			"Feature.CloudClient.Label.RobloxRealityGraphics",
			"Feature.CloudClient.Label.RobloxRealityPlusOnly"
		},
		accept = {
			"Feature.CloudClient.Action.TryRobloxReality",
			productName = FStringLuaAppCloudClientRobloxRealityNameModule
		},
		decline = {
			"Feature.CloudClient.Action.PlayWithoutRobloxReality",
			productName = FStringLuaAppCloudClientRobloxRealityNameModule
		}
	},
	CloudPlay = {
		title = "Feature.CloudClient.Heading.CloudPlayOffer",
		body = "Feature.CloudClient.Description.CloudPlayOffer",
		accept = "Feature.ExperienceDetails.PlayButtonText.Play",
		decline = "Feature.CloudClient.Action.PlayWithoutCloudPlay",
		features = {}
	}
}