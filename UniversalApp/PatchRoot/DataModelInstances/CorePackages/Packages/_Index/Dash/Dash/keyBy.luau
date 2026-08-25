local collectModule = require(script.Parent.collect)

return function(p0, p1)
	-- upvalues: collectModule (ref)
	return collectModule(p0, function(p2, p3)
		-- upvalues: p1 (ref)
		return if typeof(p1) == "function" then p1(p3, p2) else p3[p1], p3
	end)
end