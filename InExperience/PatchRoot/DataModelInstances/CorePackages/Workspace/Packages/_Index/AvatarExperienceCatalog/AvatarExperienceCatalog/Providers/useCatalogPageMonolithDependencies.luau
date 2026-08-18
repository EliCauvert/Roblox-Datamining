local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local catalogPageMonolithDependenciesContextModule = require(script.Parent.CatalogPageMonolithDependenciesContext)

return function() --[[ line: 8 | named "useCatalogPageMonolithDependencies" ]]
	-- upvalues: reactModule (ref), catalogPageMonolithDependenciesContextModule (ref)
	local var2 = reactModule.useContext(catalogPageMonolithDependenciesContextModule)
	assert(var2, "useCatalogPageMonolithDependencies must be used within a CatalogPageMonolithDependenciesContext.Provider")
	
	return var2
end