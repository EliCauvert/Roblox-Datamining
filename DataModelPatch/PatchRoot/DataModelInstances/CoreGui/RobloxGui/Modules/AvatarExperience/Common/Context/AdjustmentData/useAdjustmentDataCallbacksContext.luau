local ReactModule = require(game:GetService("CorePackages").Packages.React)
local AdjustmentDataCallbacksContextModule = require(script.Parent.AdjustmentDataCallbacksContext)

return function()
	-- upvalues: ReactModule (copy), AdjustmentDataCallbacksContextModule (copy)
	return (ReactModule.useContext(AdjustmentDataCallbacksContextModule))
end