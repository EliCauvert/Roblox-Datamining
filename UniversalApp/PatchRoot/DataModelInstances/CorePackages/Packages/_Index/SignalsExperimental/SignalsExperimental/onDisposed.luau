local _ = require(script.Parent.Parent.Signals)

return function(p0, p1)
	p0(function(_, p2)
		-- upvalues: p1 (ref)
		if p2 then
			p1()
		end
		return 0
	end)
end