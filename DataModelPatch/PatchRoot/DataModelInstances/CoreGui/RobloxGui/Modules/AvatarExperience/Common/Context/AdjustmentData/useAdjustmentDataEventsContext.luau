local ReactModule = require(game:GetService("CorePackages").Packages.React)
local AdjustmentDataEventsContextModule = require(script.Parent.AdjustmentDataEventsContext)

return function()
	-- upvalues: ReactModule (copy), AdjustmentDataEventsContextModule (copy)
	return ReactModule.useContext(AdjustmentDataEventsContextModule)
end