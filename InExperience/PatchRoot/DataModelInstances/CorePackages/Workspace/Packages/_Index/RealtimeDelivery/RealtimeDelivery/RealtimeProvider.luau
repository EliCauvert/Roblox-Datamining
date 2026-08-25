local reactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local realtimeContextModule = require(script.Parent.RealtimeContext)

return function(p0)
	-- upvalues: reactModule (ref), realtimeContextModule (ref)
	return reactModule.createElement(realtimeContextModule.Provider, { value = p0.realtime }, p0.children)
end