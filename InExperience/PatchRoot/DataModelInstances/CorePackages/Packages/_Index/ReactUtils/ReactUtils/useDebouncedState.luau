local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local UseDebounceModule = require(script.Parent.useDebounce)

return function(p1, p2) --[[ Line: 9 | Named "useDebouncedState" ]]
	-- upvalues: ReactModule (copy), UseDebounceModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1)
	
	return UseDebounceModule(UseStateResult, p2), UseStateResult2
end