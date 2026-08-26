local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(p1)
	var1.current = p1
	
	return var1
end