local CloudClientOffer = script:FindFirstAncestor("CloudClientOffer")
local CreateCloudClientOfferModule = require(CloudClientOffer.createCloudClientOffer)
local GetDefaultCloudClientOfferDependenciesFunction = require(CloudClientOffer.getDefaultCloudClientOfferDependencies).getDefaultCloudClientOfferDependencies

return require(CloudClientOffer.Parent.Signals).createComputed(function()
	-- upvalues: CreateCloudClientOfferModule (copy), GetDefaultCloudClientOfferDependenciesFunction (copy)
	return CreateCloudClientOfferModule(GetDefaultCloudClientOfferDependenciesFunction())
end)