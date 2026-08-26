local _ = require(script:FindFirstAncestor("RealtimeDelivery").RealtimeTypes)
local useRealtimeNamespaceModule = require(script.Parent.useRealtimeNamespace)

return function(p1, p2, p3, p4)
	-- upvalues: useRealtimeNamespaceModule (ref)
	useRealtimeNamespaceModule(p1, function(p5)
		-- upvalues: p2 (ref), p3 (ref)
		if p5.Type == p2 then
			p3(p5)
		end
	end, p4)
end