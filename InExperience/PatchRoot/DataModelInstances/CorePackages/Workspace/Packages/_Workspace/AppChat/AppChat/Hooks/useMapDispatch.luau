local parent = script:FindFirstAncestor("AppChat").Parent
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref)
	local var1 = useDispatch()
	
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (ref)
		return p1(var1)
	end, { var1, p1 })
end