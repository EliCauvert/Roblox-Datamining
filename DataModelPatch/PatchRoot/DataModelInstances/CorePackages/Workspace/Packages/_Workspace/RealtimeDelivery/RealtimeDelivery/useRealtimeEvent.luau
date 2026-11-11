local _ = require(script:FindFirstAncestor("RealtimeDelivery").RealtimeTypes)
local UseRealtimeNamespaceModule = require(script.Parent.useRealtimeNamespace)

return function(p1, Type, Callback, p2)
	-- upvalues: UseRealtimeNamespaceModule (copy)
	UseRealtimeNamespaceModule(p1, function(p3)
		-- upvalues: Type (copy), Callback (copy)
		if p3.Type == Type then
			Callback(p3)
		end
	end, p2)
end