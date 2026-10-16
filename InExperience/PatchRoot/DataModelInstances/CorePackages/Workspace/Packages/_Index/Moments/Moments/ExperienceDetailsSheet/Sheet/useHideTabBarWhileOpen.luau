local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local SetTabBarVisibleFunction = require(Parent.AppTabBarRodux).Actions.SetTabBarVisible

return function(p1) --[[ Line: 22 | Named "useHideTabBarWhileOpen" ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SetTabBarVisibleFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function() --[[ Line: 27 ]]
		-- upvalues: p1 (copy), UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
		if p1 then
			UseDispatchResult(SetTabBarVisibleFunction(false))
		end
		return function() --[[ Line: 32 ]]
			-- upvalues: p1 (upval), UseDispatchResult (upval), SetTabBarVisibleFunction (upval)
			if p1 then
				UseDispatchResult(SetTabBarVisibleFunction(true))
			end
		end
	end, { p1, UseDispatchResult })
end