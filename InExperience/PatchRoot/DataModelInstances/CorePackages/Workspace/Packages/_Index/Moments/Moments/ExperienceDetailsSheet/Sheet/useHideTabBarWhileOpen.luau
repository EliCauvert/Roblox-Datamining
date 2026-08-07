local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible

return function(p0) --[[ line: 20 | named "useHideTabBarWhileOpen" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), setTabBarVisible (ref)
	local var1 = useDispatch()
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: p0 (ref), var1 (ref), setTabBarVisible (copy)
		if p0 then
			var1(setTabBarVisible(false))
		end
		return function() --[[ line: 30 ]]
			-- upvalues: p0 (copy), var1 (copy), setTabBarVisible (copy)
			if p0 then
				var1(setTabBarVisible(true))
			end
		end
	end, { p0, var1 })
end