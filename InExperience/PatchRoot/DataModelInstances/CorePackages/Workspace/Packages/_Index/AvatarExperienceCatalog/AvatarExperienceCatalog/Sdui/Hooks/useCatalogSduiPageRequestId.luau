local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local catalogSduiPageContextModule = require(avatarExperienceCatalog.Sdui.CatalogSduiPageContext)
local getCatalogPageRequestIdStoreModule = require(avatarExperienceCatalog.Stores.GetCatalogPageRequestIdStore)

return function() --[[ line: 23 | named "useCatalogSduiPageRequestId" ]]
	-- upvalues: reactModule (ref), catalogSduiPageContextModule (ref), getCatalogPageRequestIdStoreModule (ref), useSignalState (ref)
	local var4 = reactModule.useContext(catalogSduiPageContextModule)
	local var5 = if var4 then var4.identifier else nil
	local var6 = getCatalogPageRequestIdStoreModule(false)
	local var7 = useSignalState(var6.getPageRequestIdMap)[var5 or ""]
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: var5 (ref), var6 (ref)
		if var5 ~= nil then
			var6.getOrCreatePageRequestId(var5)
		end
	end, { var5, var6 })
	
	return var5, var7
end