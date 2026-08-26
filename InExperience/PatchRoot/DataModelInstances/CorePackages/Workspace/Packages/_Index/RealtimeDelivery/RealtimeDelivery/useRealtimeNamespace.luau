local realtimeDelivery = script:FindFirstAncestor("RealtimeDelivery")
local parent = realtimeDelivery.Parent
local list = require(parent.Cryo).List
local reactModule = require(parent.React)
local _ = require(realtimeDelivery.RealtimeTypes)
local useRobloxEventReceiverModule = require(script.Parent.useRobloxEventReceiver)

return function(p1, p2, p3)
	-- upvalues: useRobloxEventReceiverModule (ref), reactModule (ref), list (ref)
	local var1 = useRobloxEventReceiverModule()
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref), p2 (ref)
		local var2 = var1:observeEvent(p1, p2)
		
		return function()
			-- upvalues: var2 (ref)
			var2:disconnect()
		end
	end, list.join({ p1, var1 }, p3))
end