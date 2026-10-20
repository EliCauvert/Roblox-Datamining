local Parent = script:FindFirstAncestor("AppChat").Parent
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ReactModule = require(Parent.React)

return function(Callback)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.useMemo(function()
		-- upvalues: Callback (copy), UseDispatchResult (copy)
		return Callback(UseDispatchResult)
	end, { UseDispatchResult, Callback })
end