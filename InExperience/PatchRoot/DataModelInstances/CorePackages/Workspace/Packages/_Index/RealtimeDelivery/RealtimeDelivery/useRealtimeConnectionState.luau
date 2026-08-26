local reactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local useRobloxEventReceiverModule = require(script.Parent.useRobloxEventReceiver)

return function()
	-- upvalues: useRobloxEventReceiverModule (ref), reactModule (ref)
	local var1 = useRobloxEventReceiverModule()
	local var2, var3 = reactModule.useState(Enum.ConnectionState.Connected)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		local signalR = var1:observeEvent("signalR", function(p1)
			-- upvalues: var3 (copy)
			var3(p1)
		end)
		
		return function()
			-- upvalues: signalR (ref)
			signalR:disconnect()
		end
	end, { var1 })
	
	return var2
end