local _ = require(script.Parent.Parent.Types)

return function(p1) --[[ Line: 3 ]]
	return function(p2) --[[ Line: 4 ]]
		-- upvalues: p1 (copy)
		p1:reportCounter(p2.name, p2.count or 1)
		
		return p2
	end
end