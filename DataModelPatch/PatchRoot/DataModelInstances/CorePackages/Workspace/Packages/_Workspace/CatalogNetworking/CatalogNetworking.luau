local CreateGetItemAndBundleDetailsModule = require(script.networkRequests.createGetItemAndBundleDetails)
local _ = require(script.Types)
local FFlagSocialEnableProfileInspectAndBuy = require(script:FindFirstAncestor("CatalogNetworking").Parent.Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy

return {
	config = function(p1)
		-- upvalues: CreateGetItemAndBundleDetailsModule (copy)
		return {
			GetItemAndBundleDetails = CreateGetItemAndBundleDetailsModule(p1)
		}
	end,
	PurchaseDetailsStore = if FFlagSocialEnableProfileInspectAndBuy then require(script.stores.PurchaseDetailsStore) else nil,
	CollectibleProductIdStore = if FFlagSocialEnableProfileInspectAndBuy then require(script.stores.CollectibleProductIdStore) else nil,
	BundleOwnershipStore = if FFlagSocialEnableProfileInspectAndBuy then require(script.stores.BundleOwnershipStore) else nil,
	ItemDetailsStore = if FFlagSocialEnableProfileInspectAndBuy then require(script.stores.ItemDetailsStore) else nil,
	["jest.config"] = script["jest.config"]
}