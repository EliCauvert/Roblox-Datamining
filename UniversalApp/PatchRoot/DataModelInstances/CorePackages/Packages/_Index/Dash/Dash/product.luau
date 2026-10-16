local ReduceModule = require(script.Parent.reduce)

return function(p1) --[[ Line: 16 | Named "product" ]]
	-- upvalues: ReduceModule (copy)
	return ReduceModule(p1, function(p2, p3) --[[ Line: 17 ]]
		return p2 * p3
	end, 1)
end