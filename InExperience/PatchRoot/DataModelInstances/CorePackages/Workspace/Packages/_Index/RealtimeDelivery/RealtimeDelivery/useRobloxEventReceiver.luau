local reactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local realtimeContextModule = require(script.Parent.RealtimeContext)

return function()
	-- upvalues: reactModule (ref), realtimeContextModule (ref)
	return reactModule.useContext(realtimeContextModule)
end