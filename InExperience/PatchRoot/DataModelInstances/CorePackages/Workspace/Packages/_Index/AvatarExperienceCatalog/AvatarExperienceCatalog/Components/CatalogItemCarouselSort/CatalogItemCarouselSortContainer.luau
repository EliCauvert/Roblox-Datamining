local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local catalogItemCarouselSortViewModule = require(script.Parent.CatalogItemCarouselSortView)
local useCatalogItemCarouselSortViewModelModule = require(script.Parent.useCatalogItemCarouselSortViewModel)

return reactModule.forwardRef(function(p0, p1) --[[ line: 19 | named "CatalogItemCarouselSortContainer" ]]
	-- upvalues: useCatalogItemCarouselSortViewModelModule (ref), reactModule (ref), catalogItemCarouselSortViewModule (ref)
	return reactModule.createElement(catalogItemCarouselSortViewModule, useCatalogItemCarouselSortViewModelModule(p0, p1))
end)