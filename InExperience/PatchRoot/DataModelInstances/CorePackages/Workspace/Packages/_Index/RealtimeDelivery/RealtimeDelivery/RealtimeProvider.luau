local reactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local realtimeContextModule = require(script.Parent.RealtimeContext)

return function(p1)
	-- upvalues: reactModule (ref), realtimeContextModule (ref)
	return reactModule.createElement(realtimeContextModule.Provider, { value = p1.realtime }, p1.children)
end