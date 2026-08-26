local _ = require(script.Parent.Parent.Signals)

return function(p1, p2)
	p1(function(_, p3)
		-- upvalues: p2 (ref)
		if p3 then
			p2()
		end
		return 0
	end)
end