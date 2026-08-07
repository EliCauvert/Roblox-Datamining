local _ = require(script:FindFirstAncestor("RealtimeDelivery").RealtimeTypes)
local useRealtimeNamespaceModule = require(script.Parent.useRealtimeNamespace)

return function(p0, p1, p2, p3) --[[ line: 8 | named "useRealtimeEvent" ]]
	-- upvalues: useRealtimeNamespaceModule (ref)
	useRealtimeNamespaceModule(p0, function(p4) --[[ line: 14 ]]
		-- upvalues: p1 (ref), p2 (ref)
		if p4.Type == p1 then
			p2(p4)
		end
	end, p3)
end