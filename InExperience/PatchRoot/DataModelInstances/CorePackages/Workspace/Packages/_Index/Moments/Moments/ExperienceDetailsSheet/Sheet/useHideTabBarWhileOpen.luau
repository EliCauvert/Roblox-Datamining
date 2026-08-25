local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible

return function(p0)
	-- upvalues: useDispatch (ref), reactModule (ref), setTabBarVisible (ref)
	local var1 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var1 (ref), setTabBarVisible (copy)
		if p0 then
			var1(setTabBarVisible(false))
		end
		return function()
			-- upvalues: p0 (copy), var1 (copy), setTabBarVisible (copy)
			if p0 then
				var1(setTabBarVisible(true))
			end
		end
	end, { p0, var1 })
end