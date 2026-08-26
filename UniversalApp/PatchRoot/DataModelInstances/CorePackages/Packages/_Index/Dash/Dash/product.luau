local reduceModule = require(script.Parent.reduce)

return function(p1)
	-- upvalues: reduceModule (ref)
	return reduceModule(p1, function(p2, p3)
		return p2 * p3
	end, 1)
end