local ReactModule = require(script:FindFirstAncestor("ultimate-list").Parent.React)

return function(Callback, p1, p2, p3)
	-- upvalues: ReactModule (copy)
	return ReactModule.joinBindings({ p1, p2, p3 }):map(function(p4)
		-- upvalues: Callback (copy)
		return Callback(unpack(p4))
	end)
end