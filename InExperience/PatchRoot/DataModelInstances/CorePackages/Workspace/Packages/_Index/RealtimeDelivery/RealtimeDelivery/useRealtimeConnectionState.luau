local reactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local useRobloxEventReceiverModule = require(script.Parent.useRobloxEventReceiver)

return function()
	-- upvalues: useRobloxEventReceiverModule (ref), reactModule (ref)
	local var2 = useRobloxEventReceiverModule()
	local var3, var4 = reactModule.useState(Enum.ConnectionState.Connected)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		local signalR = var2:observeEvent("signalR", function(p0)
			-- upvalues: var4 (copy)
			var4(p0)
		end)
		
		return function()
			-- upvalues: signalR (ref)
			signalR:disconnect()
		end
	end, { var2 })
	
	return var3
end