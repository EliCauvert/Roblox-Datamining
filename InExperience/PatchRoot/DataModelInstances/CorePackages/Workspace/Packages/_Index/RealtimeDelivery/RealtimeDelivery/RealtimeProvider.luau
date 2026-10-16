local ReactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local RealtimeContextModule = require(script.Parent.RealtimeContext)

return function(p1) --[[ Line: 12 | Named "RealtimeProvider" ]]
	-- upvalues: ReactModule (copy), RealtimeContextModule (copy)
	return ReactModule.createElement(RealtimeContextModule.Provider, { value = p1.realtime }, p1.children)
end