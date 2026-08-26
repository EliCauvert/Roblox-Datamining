local _ = require(script.Parent.Types)

return function(p1, p2)
	return function(p3)
		-- upvalues: p1 (ref), p2 (ref)
		if p1 then
			p1:info(p2(p3))
		end
		return p3
	end
end