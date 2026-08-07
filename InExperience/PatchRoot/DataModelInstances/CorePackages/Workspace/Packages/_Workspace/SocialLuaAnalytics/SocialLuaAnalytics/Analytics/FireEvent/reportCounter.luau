local _ = require(script.Parent.Parent.Types)

return function(p0) --[[ line: 3 ]]
	return function(p1) --[[ line: 4 ]]
		-- upvalues: p0 (ref)
		p0:reportCounter(p1.name, p1.count or 1)
		
		return p1
	end
end