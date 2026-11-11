local ReactModule = require(game:GetService("CorePackages").Packages.React)
local FavoritePillViewModule = require(script.Parent.FavoritePillView)
local UseFavoritePillViewModelModule = require(script.Parent.useFavoritePillViewModel)

return function(p1)
	-- upvalues: UseFavoritePillViewModelModule (copy), ReactModule (copy), FavoritePillViewModule (copy)
	return ReactModule.createElement(FavoritePillViewModule, (UseFavoritePillViewModelModule(p1)))
end