local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), setTabBarVisible (ref)
	local var1 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), setTabBarVisible (copy)
		if p1 then
			var1(setTabBarVisible(false))
		end
		return function()
			-- upvalues: p1 (copy), var1 (copy), setTabBarVisible (copy)
			if p1 then
				var1(setTabBarVisible(true))
			end
		end
	end, { p1, var1 })
end