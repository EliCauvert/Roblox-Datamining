local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local catalogSduiPageContextModule = require(avatarExperienceCatalog.Sdui.CatalogSduiPageContext)
local getCatalogPageRequestIdStoreModule = require(avatarExperienceCatalog.Stores.GetCatalogPageRequestIdStore)

return function()
	-- upvalues: reactModule (ref), catalogSduiPageContextModule (ref), getCatalogPageRequestIdStoreModule (ref), useSignalState (ref)
	local var1 = reactModule.useContext(catalogSduiPageContextModule)
	local var2 = if var1 then var1.identifier else nil
	local var3 = getCatalogPageRequestIdStoreModule(false)
	local var4 = useSignalState(var3.getPageRequestIdMap)[var2 or ""]
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref)
		if var2 ~= nil then
			var3.getOrCreatePageRequestId(var2)
		end
	end, { var2, var3 })
	
	return var2, var4
end