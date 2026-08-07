local realtimeDelivery = script:FindFirstAncestor("RealtimeDelivery")
local parent = realtimeDelivery.Parent
local list = require(parent.Cryo).List
local reactModule = require(parent.React)
local _ = require(realtimeDelivery.RealtimeTypes)
local useRobloxEventReceiverModule = require(script.Parent.useRobloxEventReceiver)

return function(p0, p1, p2) --[[ line: 11 | named "useRealtimeNamespace" ]]
	-- upvalues: useRobloxEventReceiverModule (ref), reactModule (ref), list (ref)
	local var3 = useRobloxEventReceiverModule()
	reactModule.useEffect(function() --[[ line: 14 ]]
		-- upvalues: var3 (ref), p0 (ref), p1 (ref)
		local var4 = var3:observeEvent(p0, p1)
		
		return function() --[[ line: 17 ]]
			-- upvalues: var4 (ref)
			var4:disconnect()
		end
	end, list.join({ p0, var3 }, p2))
end