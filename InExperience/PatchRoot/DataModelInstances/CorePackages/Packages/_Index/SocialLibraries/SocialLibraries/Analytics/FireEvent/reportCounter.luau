local _ = require(script.Parent.Types)

return function(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		p1:reportCounter(p2.name, p2.count or 1)
		
		return p2
	end
end