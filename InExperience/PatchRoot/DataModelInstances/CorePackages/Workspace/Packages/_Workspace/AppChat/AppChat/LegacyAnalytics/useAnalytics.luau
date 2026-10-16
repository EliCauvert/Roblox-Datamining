local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local AnalyticsContextModule = require(script.Parent.AnalyticsContext)

return function() --[[ Line: 7 ]]
	-- upvalues: ReactModule (copy), AnalyticsContextModule (copy)
	return ReactModule.useContext(AnalyticsContextModule)
end