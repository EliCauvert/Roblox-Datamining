local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local catalogPageMonolithDependenciesContextModule = require(script.Parent.CatalogPageMonolithDependenciesContext)

return function()
	-- upvalues: reactModule (ref), catalogPageMonolithDependenciesContextModule (ref)
	local var1 = reactModule.useContext(catalogPageMonolithDependenciesContextModule)
	assert(var1, "useCatalogPageMonolithDependencies must be used within a CatalogPageMonolithDependenciesContext.Provider")
	
	return var1
end