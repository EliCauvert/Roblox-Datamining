local reduceModule = require(script.Parent.reduce)

return function(p0) --[[ line: 16 | named "product" ]]
	-- upvalues: reduceModule (ref)
	return reduceModule(p0, function(p1, p2) --[[ line: 17 ]]
		return p1 * p2
	end, 1)
end