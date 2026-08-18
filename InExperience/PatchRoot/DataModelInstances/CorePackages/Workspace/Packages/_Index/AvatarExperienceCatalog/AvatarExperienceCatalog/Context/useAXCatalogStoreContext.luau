local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local reactModule = require(avatarExperienceCatalog.Parent.React)
local AXCatalogStoreContextModule = require(avatarExperienceCatalog.Context.AXCatalogStoreContext)
local storesModule = require(avatarExperienceCatalog.Stores)

return function() --[[ line: 10 | named "useAXCatalogStoreContext" ]]
	-- upvalues: reactModule (ref), AXCatalogStoreContextModule (ref), storesModule (ref)
	local var4 = reactModule.useContext(AXCatalogStoreContextModule)
	
	if var4 then
		return var4
	end
	warn("useAXCatalogStoreContext must be used within an AXCatalogStoreContext provider")
	
	return storesModule()
end