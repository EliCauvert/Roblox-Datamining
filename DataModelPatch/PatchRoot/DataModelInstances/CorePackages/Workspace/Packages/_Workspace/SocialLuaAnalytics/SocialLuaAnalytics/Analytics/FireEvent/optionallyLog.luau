local _ = require(script.Parent.Parent.Types)

return function(p1, Callback)
	return function(p2)
		-- upvalues: p1 (copy), Callback (copy)
		if p1 then
			p1:info(Callback(p2))
		end
		return p2
	end
end