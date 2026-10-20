local SetPriceRangeModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Actions.SetPriceRange)

return function(p1, p2, p3)
	-- upvalues: SetPriceRangeModule (copy)
	return function(p4)
		-- upvalues: SetPriceRangeModule (upval), p1 (copy), p2 (copy), p3 (copy)
		p4:dispatch(SetPriceRangeModule(p1, p2))
		p3.applyPriceFilter(p1, p2)
	end
end