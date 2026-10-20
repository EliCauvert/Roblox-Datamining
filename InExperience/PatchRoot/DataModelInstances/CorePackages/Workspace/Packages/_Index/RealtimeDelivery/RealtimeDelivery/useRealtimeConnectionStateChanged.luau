local RealtimeDelivery = script:FindFirstAncestor("RealtimeDelivery")
local Parent = RealtimeDelivery.Parent
local List = require(Parent.Cryo).List
local ReactModule = require(Parent.React)
local _ = require(RealtimeDelivery.RealtimeTypes)
local UseRobloxEventReceiverModule = require(script.Parent.useRobloxEventReceiver)
local UseRealtimeNamespaceModule = require(script.Parent.useRealtimeNamespace)

return function(p1, Callback, p2)
	-- upvalues: UseRobloxEventReceiverModule (copy), ReactModule (copy), UseRealtimeNamespaceModule (copy), List (copy)
	local UseRobloxEventReceiverModuleResult = UseRobloxEventReceiverModule()
	local UseRefResult = ReactModule.useRef(nil)
	UseRealtimeNamespaceModule(p1, function(p3)
		-- upvalues: UseRefResult (copy)
		local SequenceNumber = p3.SequenceNumber
		
		if SequenceNumber and (UseRefResult.current == nil or UseRefResult.current < SequenceNumber) then
			UseRefResult.current = SequenceNumber
		end
	end, List.join({ p1 }, p2))
	ReactModule.useEffect(function()
		-- upvalues: UseRobloxEventReceiverModuleResult (copy), p1 (copy), UseRefResult (copy), Callback (copy)
		local SignalR = UseRobloxEventReceiverModuleResult:observeEvent("signalR", function(p3, _, p4)
			-- upvalues: p1 (upval), UseRefResult (upval), Callback (upval)
			local Current = p4[p1]
			local NoCurrent: boolean = Current ~= nil and (UseRefResult.current == nil or UseRefResult.current ~= Current)
			
			if Current then
				UseRefResult.current = Current
			end
			Callback(p3, NoCurrent)
		end)
		
		return function()
			-- upvalues: SignalR (copy)
			SignalR:disconnect()
		end
	end, List.join({ UseRobloxEventReceiverModuleResult, UseRefResult.current }, p2))
end