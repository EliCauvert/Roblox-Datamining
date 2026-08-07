local _ = require(script.Parent.Parent.Signals)

return function(p0, p1) --[[ line: 7 | named "onDisposed" ]]
	p0(function(_, p2) --[[ line: 8 | named "source" ]]
		-- upvalues: p1 (ref)
		if p2 then
			p1()
		end
		return 0
	end)
end