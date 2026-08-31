local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local catalogItemCarouselSortViewModule = require(script.Parent.CatalogItemCarouselSortView)
local useCatalogItemCarouselSortViewModelModule = require(script.Parent.useCatalogItemCarouselSortViewModel)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useCatalogItemCarouselSortViewModelModule (ref), reactModule (ref), catalogItemCarouselSortViewModule (ref)
	return reactModule.createElement(catalogItemCarouselSortViewModule, useCatalogItemCarouselSortViewModelModule(p1, p2))
end)