local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CatalogSduiPageContextModule = require(AvatarExperienceCatalog.Sdui.CatalogSduiPageContext)
local GetCatalogPageRequestIdStoreModule = require(AvatarExperienceCatalog.Stores.GetCatalogPageRequestIdStore)

return function()
	-- upvalues: ReactModule (copy), CatalogSduiPageContextModule (copy), GetCatalogPageRequestIdStoreModule (copy), UseSignalStateFunction (copy)
	local UseContextResult = ReactModule.useContext(CatalogSduiPageContextModule)
	local Identifier = if UseContextResult then UseContextResult.identifier else nil
	local CatalogPageRequestIdStoreModule = GetCatalogPageRequestIdStoreModule(false)
	local UseSignalStateResultEntry = UseSignalStateFunction(CatalogPageRequestIdStoreModule.getPageRequestIdMap)[Identifier or ""]
	ReactModule.useEffect(function()
		-- upvalues: Identifier (copy), CatalogPageRequestIdStoreModule (copy)
		if Identifier ~= nil then
			CatalogPageRequestIdStoreModule.getOrCreatePageRequestId(Identifier)
		end
	end, { Identifier, CatalogPageRequestIdStoreModule })
	
	return Identifier, UseSignalStateResultEntry
end