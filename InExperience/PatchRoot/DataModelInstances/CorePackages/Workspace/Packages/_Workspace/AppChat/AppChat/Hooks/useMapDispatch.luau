local parent = script:FindFirstAncestor("AppChat").Parent
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local reactModule = require(parent.React)

return function(p0) --[[ line: 7 ]]
	-- upvalues: useDispatch (ref), reactModule (ref)
	local var1 = useDispatch()
	
	return reactModule.useMemo(function() --[[ line: 10 ]]
		-- upvalues: p0 (ref), var1 (ref)
		return p0(var1)
	end, { var1, p0 })
end