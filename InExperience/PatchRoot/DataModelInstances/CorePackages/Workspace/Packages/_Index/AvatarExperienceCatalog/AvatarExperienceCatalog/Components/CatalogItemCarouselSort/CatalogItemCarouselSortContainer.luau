local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local CatalogItemCarouselSortViewModule = require(script.Parent.CatalogItemCarouselSortView)
local UseCatalogItemCarouselSortViewModelModule = require(script.Parent.useCatalogItemCarouselSortViewModel)

return ReactModule.forwardRef(function(p1, p2) --[[ Line: 19 | Named "CatalogItemCarouselSortContainer" ]]
	-- upvalues: UseCatalogItemCarouselSortViewModelModule (copy), ReactModule (copy), CatalogItemCarouselSortViewModule (copy)
	return ReactModule.createElement(CatalogItemCarouselSortViewModule, (UseCatalogItemCarouselSortViewModelModule(p1, p2)))
end)