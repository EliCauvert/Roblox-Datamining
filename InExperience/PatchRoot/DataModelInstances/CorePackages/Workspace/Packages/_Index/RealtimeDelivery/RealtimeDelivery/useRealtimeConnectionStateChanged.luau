local realtimeDelivery = script:FindFirstAncestor("RealtimeDelivery")
local parent = realtimeDelivery.Parent
local list = require(parent.Cryo).List
local reactModule = require(parent.React)
local _ = require(realtimeDelivery.RealtimeTypes)
local useRobloxEventReceiverModule = require(script.Parent.useRobloxEventReceiver)
local useRealtimeNamespaceModule = require(script.Parent.useRealtimeNamespace)

return function(p1, p2, p3)
	-- upvalues: useRobloxEventReceiverModule (ref), reactModule (ref), useRealtimeNamespaceModule (ref), list (ref)
	local var1 = useRobloxEventReceiverModule()
	local var2 = reactModule.useRef(nil)
	useRealtimeNamespaceModule(p1, function(p4)
		-- upvalues: var2 (ref)
		local sequenceNumber = p4.SequenceNumber
		
		if sequenceNumber and (var2.current == nil or var2.current < sequenceNumber) then
			var2.current = sequenceNumber
		end
	end, list.join({ p1 }, p3))
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref), var2 (ref), p2 (ref)
		local signalR = var1:observeEvent("signalR", function(p4, _, p5)
			-- upvalues: p1 (copy), var2 (copy), p2 (copy)
			local var3 = p5[p1]
			local var4 = if var3 == nil then false else var2.current == nil or var2.current ~= var3
			
			if var3 then
				var2.current = var3
			end
			p2(p4, var4)
		end)
		
		return function()
			-- upvalues: signalR (ref)
			signalR:disconnect()
		end
	end, list.join({ var1, var2.current }, p3))
end