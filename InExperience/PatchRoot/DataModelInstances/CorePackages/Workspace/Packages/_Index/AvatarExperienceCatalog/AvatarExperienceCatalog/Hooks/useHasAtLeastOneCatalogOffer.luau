local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local useAXCatalogStoreContextModule = require(avatarExperienceCatalog.Context.useAXCatalogStoreContext)
local _ = require(avatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local var1 = signalsModule.createSignal(nil)

return function()
	-- upvalues: useAXCatalogStoreContextModule (ref), var1 (ref), useSignalState (ref)
	local catalogOffersBannerStore = useAXCatalogStoreContextModule().catalogOffersBannerStore
	local var2 = useSignalState(if catalogOffersBannerStore ~= nil then var1 else catalogOffersBannerStore.getPayload)
	
	if var2 == nil then
		return false
	end
	local offers = var2.offers
	
	return offers ~= nil and #offers > 0
end