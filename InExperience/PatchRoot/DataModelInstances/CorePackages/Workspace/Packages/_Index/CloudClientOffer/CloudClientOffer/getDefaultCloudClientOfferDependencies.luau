local CloudClientOffer = script:FindFirstAncestor("CloudClientOffer")
local CloudClientServiceAdapterModule = require(CloudClientOffer.CloudClientServiceAdapter)
local CloudClientExperimentModule = require(CloudClientOffer.CloudClientExperiment)
local _ = require(CloudClientOffer.createCloudClientOffer)
local GetCloudClientSessionStoreModule = require(CloudClientOffer.Stores.GetCloudClientSessionStore)
local FStringLuaAppCloudClientPlayButtonIxpLayerModule = require(CloudClientOffer.Flags.FStringLuaAppCloudClientPlayButtonIxpLayer)
local Candidates = { { kind = "RobloxReality" }, { kind = "CloudPlay" } }

return {
	getDefaultCloudClientOfferDependencies = function()
		-- upvalues: CloudClientServiceAdapterModule (copy), CloudClientExperimentModule (copy), FStringLuaAppCloudClientPlayButtonIxpLayerModule (copy), GetCloudClientSessionStoreModule (copy), Candidates (copy)
		return {
			service = CloudClientServiceAdapterModule.getCloudClientServiceAdapter(),
			experiment = CloudClientExperimentModule(game:GetService("IXPService"), FStringLuaAppCloudClientPlayButtonIxpLayerModule),
			session = GetCloudClientSessionStoreModule(false),
			candidates = Candidates
		}
	end,
	OFFER_CANDIDATES = Candidates
}