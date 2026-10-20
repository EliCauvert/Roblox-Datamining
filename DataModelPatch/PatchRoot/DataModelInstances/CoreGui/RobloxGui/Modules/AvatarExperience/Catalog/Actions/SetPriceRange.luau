local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(MinPrice, MaxPrice)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(MinPrice, "number", "SetPriceRange expects minPrice")
	ArgCheckModule.isType(MaxPrice, "number", "SetPriceRange expects maxPrice")
	
	return {
		priceRange = { minPrice = MinPrice, maxPrice = MaxPrice }
	}
end)