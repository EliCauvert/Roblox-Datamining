local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(p0)
	var1.current = p0
	
	return var1
end