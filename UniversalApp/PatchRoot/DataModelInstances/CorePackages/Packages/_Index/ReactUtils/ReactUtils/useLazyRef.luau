local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = p1()
	end
	assert(var1.current ~= nil, "Ref must be defined after initialization function is called")
	
	return var1
end