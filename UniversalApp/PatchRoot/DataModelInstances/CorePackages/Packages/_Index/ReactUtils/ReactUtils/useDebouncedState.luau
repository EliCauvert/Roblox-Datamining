local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local useDebounceModule = require(script.Parent.useDebounce)

return function(p0, p1) --[[ line: 9 | named "useDebouncedState" ]]
	-- upvalues: reactModule (ref), useDebounceModule (ref)
	local var2, var3 = reactModule.useState(p0)
	
	return useDebounceModule(var2, p1), var3
end