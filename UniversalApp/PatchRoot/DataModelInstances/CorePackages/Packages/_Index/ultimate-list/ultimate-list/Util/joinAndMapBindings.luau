local reactModule = require(script:FindFirstAncestor("ultimate-list").Parent.React)

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings({ p2, p3, p4 }):map(function(p5)
		-- upvalues: p1 (ref)
		return p1(unpack(p5))
	end)
end