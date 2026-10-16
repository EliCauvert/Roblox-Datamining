local RealtimeDelivery = script:FindFirstAncestor("RealtimeDelivery")
local Parent = RealtimeDelivery.Parent
local List = require(Parent.Cryo).List
local ReactModule = require(Parent.React)
local _ = require(RealtimeDelivery.RealtimeTypes)
local UseRobloxEventReceiverModule = require(script.Parent.useRobloxEventReceiver)

return function(p1, p2, p3) --[[ Line: 11 | Named "useRealtimeNamespace" ]]
	-- upvalues: UseRobloxEventReceiverModule (copy), ReactModule (copy), List (copy)
	local UseRobloxEventReceiverModuleResult = UseRobloxEventReceiverModule()
	ReactModule.useEffect(function() --[[ Line: 14 ]]
		-- upvalues: UseRobloxEventReceiverModuleResult (copy), p1 (copy), p2 (copy)
		local ObserveEventResult = UseRobloxEventReceiverModuleResult:observeEvent(p1, p2)
		
		return function() --[[ Line: 17 ]]
			-- upvalues: ObserveEventResult (copy)
			ObserveEventResult:disconnect()
		end
	end, List.join({ p1, UseRobloxEventReceiverModuleResult }, p3))
end