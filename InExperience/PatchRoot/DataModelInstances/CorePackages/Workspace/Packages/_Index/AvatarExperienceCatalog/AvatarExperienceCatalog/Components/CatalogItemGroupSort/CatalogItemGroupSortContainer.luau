local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local catalogItemGroupSortViewModule = require(script.Parent.CatalogItemGroupSortView)
local useCatalogItemGroupSortViewModelModule = require(script.Parent.useCatalogItemGroupSortViewModel)

return reactModule.forwardRef(function(p0, p1) --[[ line: 21 | named "CatalogItemGroupSortContainer" ]]
	-- upvalues: useCatalogItemGroupSortViewModelModule (ref), reactModule (ref), catalogItemGroupSortViewModule (ref)
	local cloned = table.clone(useCatalogItemGroupSortViewModelModule(p0))
	cloned.ref = p1
	
	return reactModule.createElement(catalogItemGroupSortViewModule, cloned)
end)