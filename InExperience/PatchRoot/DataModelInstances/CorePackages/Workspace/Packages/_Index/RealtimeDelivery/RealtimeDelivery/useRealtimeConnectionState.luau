local ReactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local UseRobloxEventReceiverModule = require(script.Parent.useRobloxEventReceiver)

return function() --[[ Line: 7 | Named "useRealtimeConnectionState" ]]
	-- upvalues: UseRobloxEventReceiverModule (copy), ReactModule (copy)
	local UseRobloxEventReceiverModuleResult = UseRobloxEventReceiverModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Enum.ConnectionState.Connected)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: UseRobloxEventReceiverModuleResult (copy), UseStateResult2 (copy)
		local SignalR = UseRobloxEventReceiverModuleResult:observeEvent("signalR", function(p1) --[[ Line: 12 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(p1)
		end)
		
		return function() --[[ Line: 16 ]]
			-- upvalues: SignalR (copy)
			SignalR:disconnect()
		end
	end, { UseRobloxEventReceiverModuleResult })
	
	return UseStateResult
end