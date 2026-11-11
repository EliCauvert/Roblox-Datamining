local ReactModule = require(game:GetService("CorePackages").Packages.React)
local CatalogResultListNavigationViewModule = require(script.Parent.CatalogResultListNavigationView)
local UseCatalogResultListNavigationViewModelModule = require(script.Parent.useCatalogResultListNavigationViewModel)

return function(p1)
	-- upvalues: UseCatalogResultListNavigationViewModelModule (copy), ReactModule (copy), CatalogResultListNavigationViewModule (copy)
	return ReactModule.createElement(CatalogResultListNavigationViewModule, (UseCatalogResultListNavigationViewModelModule(p1)))
end