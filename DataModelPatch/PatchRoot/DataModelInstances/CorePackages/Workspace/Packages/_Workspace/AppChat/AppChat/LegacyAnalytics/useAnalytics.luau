local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local AnalyticsContextModule = require(script.Parent.AnalyticsContext)

return function()
	-- upvalues: ReactModule (copy), AnalyticsContextModule (copy)
	return ReactModule.useContext(AnalyticsContextModule)
end