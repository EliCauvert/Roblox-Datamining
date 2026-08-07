local reactModule = require(script.Parent.Parent.React)

return function(p0, p1) --[[ line: 8 | named "useEventLifecycleRef" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p2) --[[ line: 10 ]]
		-- upvalues: var1 (ref), p1 (ref), p0 (ref)
		if var1.current and p1 then
			p1(var1.current)
		end
		if p2 then
			p0(p2)
		end
		var1.current = p2
	end, { p0, p1 })
end