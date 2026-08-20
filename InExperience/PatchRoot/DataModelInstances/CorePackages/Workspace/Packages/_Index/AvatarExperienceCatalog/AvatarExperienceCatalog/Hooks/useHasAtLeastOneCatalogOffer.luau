local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local useAXCatalogStoreContextModule = require(avatarExperienceCatalog.Context.useAXCatalogStoreContext)
local _ = require(avatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local var3 = signalsModule.createSignal(nil)

return function() --[[ line: 32 | named "useHasAtLeastOneCatalogOffer" ]]
	-- upvalues: useAXCatalogStoreContextModule (ref), var3 (ref), useSignalState (ref)
	local catalogOffersBannerStore = useAXCatalogStoreContextModule().catalogOffersBannerStore
	local var4 = useSignalState(if catalogOffersBannerStore ~= nil then var3 else catalogOffersBannerStore.getPayload)
	
	if var4 == nil then
		return false
	end
	local offers = var4.offers
	
	return offers ~= nil and #offers > 0
end