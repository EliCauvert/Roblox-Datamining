local realtimeDelivery = script:FindFirstAncestor("RealtimeDelivery")
local parent = realtimeDelivery.Parent
local list = require(parent.Cryo).List
local reactModule = require(parent.React)
local _ = require(realtimeDelivery.RealtimeTypes)
local useRobloxEventReceiverModule = require(script.Parent.useRobloxEventReceiver)
local useRealtimeNamespaceModule = require(script.Parent.useRealtimeNamespace)

return function(p0, p1, p2)
	-- upvalues: useRobloxEventReceiverModule (ref), reactModule (ref), useRealtimeNamespaceModule (ref), list (ref)
	local var4 = useRobloxEventReceiverModule()
	local var5 = reactModule.useRef(nil)
	useRealtimeNamespaceModule(p0, function(p3)
		-- upvalues: var5 (ref)
		local sequenceNumber = p3.SequenceNumber
		
		if sequenceNumber and (var5.current == nil or var5.current < sequenceNumber) then
			var5.current = sequenceNumber
		end
	end, list.join({ p0 }, p2))
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p0 (ref), var5 (ref), p1 (ref)
		local signalR = var4:observeEvent("signalR", function(p4, _, p5)
			-- upvalues: p0 (copy), var5 (copy), p1 (copy)
			local var7 = p5[p0]
			local var8 = if var7 == nil then false else var5.current == nil or var5.current ~= var7
			
			if var7 then
				var5.current = var7
			end
			p1(p4, var8)
		end)
		
		return function()
			-- upvalues: signalR (ref)
			signalR:disconnect()
		end
	end, list.join({ var4, var5.current }, p2))
end