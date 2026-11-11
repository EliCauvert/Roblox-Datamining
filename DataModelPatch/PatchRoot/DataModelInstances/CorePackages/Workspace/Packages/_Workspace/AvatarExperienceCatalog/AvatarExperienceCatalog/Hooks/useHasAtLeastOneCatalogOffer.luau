local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseAXCatalogStoreContextModule = require(AvatarExperienceCatalog.Context.useAXCatalogStoreContext)
local _ = require(AvatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local Signal = require(Parent.Signals).createSignal(nil)

return function(): boolean
	-- upvalues: UseAXCatalogStoreContextModule (copy), Signal (copy), UseSignalStateFunction (copy)
	local CatalogOffersBannerStore = UseAXCatalogStoreContextModule().catalogOffersBannerStore
	local UseSignalStateResult = UseSignalStateFunction(if CatalogOffersBannerStore == nil then Signal else CatalogOffersBannerStore.getPayload)
	
	if UseSignalStateResult == nil then
		return false
	else
		local Offers = UseSignalStateResult.offers
		
		return Offers ~= nil and #Offers > 0
	end
end