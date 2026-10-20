local ReactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local RealtimeContextModule = require(script.Parent.RealtimeContext)

return function()
	-- upvalues: ReactModule (copy), RealtimeContextModule (copy)
	return ReactModule.useContext(RealtimeContextModule)
end