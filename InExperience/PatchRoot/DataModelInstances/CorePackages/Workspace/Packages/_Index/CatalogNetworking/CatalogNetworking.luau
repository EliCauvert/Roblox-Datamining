local parent = script:FindFirstAncestor("CatalogNetworking").Parent.Parent
local createGetItemAndBundleDetailsModule = require(script.networkRequests.createGetItemAndBundleDetails)
local _ = require(script.Types)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy

return {
	config = function(p1)
		-- upvalues: createGetItemAndBundleDetailsModule (ref)
		return {
			GetItemAndBundleDetails = createGetItemAndBundleDetailsModule(p1)
		}
	end,
	PurchaseDetailsStore = if fFlagSocialEnableProfileInspectAndBuy then require(script.stores.PurchaseDetailsStore) else nil,
	CollectibleProductIdStore = if fFlagSocialEnableProfileInspectAndBuy then require(script.stores.CollectibleProductIdStore) else nil,
	BundleOwnershipStore = if fFlagSocialEnableProfileInspectAndBuy then require(script.stores.BundleOwnershipStore) else nil,
	ItemDetailsStore = if fFlagSocialEnableProfileInspectAndBuy then require(script.stores.ItemDetailsStore) else nil,
	["jest.config"] = script["jest.config"]
}