local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local ReactModule = require(AvatarExperienceCatalog.Parent.React)
local AXCatalogStoreContextModule = require(AvatarExperienceCatalog.Context.AXCatalogStoreContext)
local StoresModule = require(AvatarExperienceCatalog.Stores)

return function() --[[ Line: 10 | Named "useAXCatalogStoreContext" ]]
	-- upvalues: ReactModule (copy), AXCatalogStoreContextModule (copy), StoresModule (copy)
	local UseContextResult = ReactModule.useContext(AXCatalogStoreContextModule)
	
	if UseContextResult then
		return UseContextResult
	else
		warn("useAXCatalogStoreContext must be used within an AXCatalogStoreContext provider")
		
		return StoresModule()
	end
end