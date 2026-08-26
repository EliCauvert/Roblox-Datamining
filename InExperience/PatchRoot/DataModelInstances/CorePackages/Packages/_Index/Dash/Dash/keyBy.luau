local collectModule = require(script.Parent.collect)

return function(p1, p2)
	-- upvalues: collectModule (ref)
	return collectModule(p1, function(p3, p4)
		-- upvalues: p2 (ref)
		return if typeof(p2) == "function" then p2(p4, p3) else p4[p2], p4
	end)
end