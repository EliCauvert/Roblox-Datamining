local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local CatalogItemGroupSortViewModule = require(script.Parent.CatalogItemGroupSortView)
local UseCatalogItemGroupSortViewModelModule = require(script.Parent.useCatalogItemGroupSortViewModel)

return ReactModule.forwardRef(function(p1, Ref) --[[ Line: 21 | Named "CatalogItemGroupSortContainer" ]]
	-- upvalues: UseCatalogItemGroupSortViewModelModule (copy), ReactModule (copy), CatalogItemGroupSortViewModule (copy)
	local Copy = table.clone((UseCatalogItemGroupSortViewModelModule(p1)))
	Copy.ref = Ref
	
	return ReactModule.createElement(CatalogItemGroupSortViewModule, Copy)
end)