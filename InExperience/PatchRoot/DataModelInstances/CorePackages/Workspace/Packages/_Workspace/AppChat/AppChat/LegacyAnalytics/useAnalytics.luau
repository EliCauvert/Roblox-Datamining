local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local analyticsContextModule = require(script.Parent.AnalyticsContext)

return function()
	-- upvalues: reactModule (ref), analyticsContextModule (ref)
	return reactModule.useContext(analyticsContextModule)
end