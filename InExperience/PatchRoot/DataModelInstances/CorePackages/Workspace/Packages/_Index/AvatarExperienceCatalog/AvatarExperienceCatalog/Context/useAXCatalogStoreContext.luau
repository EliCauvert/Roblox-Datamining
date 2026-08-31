local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local reactModule = require(avatarExperienceCatalog.Parent.React)
local AXCatalogStoreContextModule = require(avatarExperienceCatalog.Context.AXCatalogStoreContext)
local storesModule = require(avatarExperienceCatalog.Stores)

return function()
	-- upvalues: reactModule (ref), AXCatalogStoreContextModule (ref), storesModule (ref)
	local var1 = reactModule.useContext(AXCatalogStoreContextModule)
	
	if var1 then
		return var1
	end
	warn("useAXCatalogStoreContext must be used within an AXCatalogStoreContext provider")
	
	return storesModule()
end