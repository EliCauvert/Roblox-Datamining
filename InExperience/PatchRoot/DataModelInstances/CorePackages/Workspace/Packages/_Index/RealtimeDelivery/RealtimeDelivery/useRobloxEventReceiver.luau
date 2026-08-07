local reactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local realtimeContextModule = require(script.Parent.RealtimeContext)

return function() --[[ line: 7 | named "useRobloxEventReceiver" ]]
	-- upvalues: reactModule (ref), realtimeContextModule (ref)
	return reactModule.useContext(realtimeContextModule)
end