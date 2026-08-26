local reactModule = require(script.Parent.Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), p2 (ref), p1 (ref)
		if var1.current and p2 then
			p2(var1.current)
		end
		if p3 then
			p1(p3)
		end
		var1.current = p3
	end, { p1, p2 })
end