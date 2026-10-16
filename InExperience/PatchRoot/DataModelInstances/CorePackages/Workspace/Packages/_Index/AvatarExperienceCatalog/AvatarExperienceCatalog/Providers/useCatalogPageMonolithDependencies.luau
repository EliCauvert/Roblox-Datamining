local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local CatalogPageMonolithDependenciesContextModule = require(script.Parent.CatalogPageMonolithDependenciesContext)

return function() --[[ Line: 8 | Named "useCatalogPageMonolithDependencies" ]]
	-- upvalues: ReactModule (copy), CatalogPageMonolithDependenciesContextModule (copy)
	local UseContextResult = ReactModule.useContext(CatalogPageMonolithDependenciesContextModule)
	assert(UseContextResult, "useCatalogPageMonolithDependencies must be used within a CatalogPageMonolithDependenciesContext.Provider")
	
	return UseContextResult
end