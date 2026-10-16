local _ = require(script.Parent.Types)

return function(p1, Callback) --[[ Line: 4 ]]
	return function(p2) --[[ Line: 5 ]]
		-- upvalues: p1 (copy), Callback (copy)
		if p1 then
			p1:info(Callback(p2))
		end
		return p2
	end
end