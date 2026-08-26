local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local catalogItemGroupSortViewModule = require(script.Parent.CatalogItemGroupSortView)
local useCatalogItemGroupSortViewModelModule = require(script.Parent.useCatalogItemGroupSortViewModel)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useCatalogItemGroupSortViewModelModule (ref), reactModule (ref), catalogItemGroupSortViewModule (ref)
	local cloned = table.clone(useCatalogItemGroupSortViewModelModule(p1))
	cloned.ref = p2
	
	return reactModule.createElement(catalogItemGroupSortViewModule, cloned)
end)