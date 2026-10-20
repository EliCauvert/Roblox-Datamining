local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local _ = require(Parent.AppCommonLib)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local _ = require(Parent.Navigation)

return function(Callback1, Callback)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return (ReactModule.useCallback(function(_, p1, _)
		-- upvalues: Callback (copy), UseDispatchResult (copy), Callback1 (copy)
		if Callback then
			Callback(p1)
		end
		UseDispatchResult(Callback1(p1))
	end, { UseDispatchResult, Callback1, Callback }))
end