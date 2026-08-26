local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local useDebounceModule = require(script.Parent.useDebounce)

return function(p1, p2)
	-- upvalues: reactModule (ref), useDebounceModule (ref)
	local var1, var2 = reactModule.useState(p1)
	
	return useDebounceModule(var1, p2), var2
end