local CollectModule = require(script.Parent.collect)

return function(p1, Callback)
	-- upvalues: CollectModule (copy)
	return CollectModule(p1, function(p2, p3)
		-- upvalues: Callback (copy)
		return if typeof(Callback) == "function" then Callback(p3, p2) else p3[Callback], p3
	end)
end