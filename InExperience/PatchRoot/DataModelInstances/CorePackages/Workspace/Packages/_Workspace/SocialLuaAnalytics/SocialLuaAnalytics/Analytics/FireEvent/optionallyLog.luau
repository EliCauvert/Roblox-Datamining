local _ = require(script.Parent.Parent.Types)

return function(p0, p1)
	return function(p2)
		-- upvalues: p0 (ref), p1 (ref)
		if p0 then
			p0:info(p1(p2))
		end
		return p2
	end
end