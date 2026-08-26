local appTabBarRodux = script:FindFirstAncestor("AppTabBarRodux")
local argCheckModule = require(appTabBarRodux.Parent.ArgCheck)
local setTabBarVisibleModule = require(appTabBarRodux.Actions.SetTabBarVisible)

return function(p1)
	-- upvalues: argCheckModule (ref), setTabBarVisibleModule (ref)
	argCheckModule.isType(p1, "boolean", "SetTabBarVisibleFromMoments.isVisible")
	
	return function(p2)
		-- upvalues: p1 (ref), setTabBarVisibleModule (copy)
		if p2:getState().TabBarVisible ~= p1 then
			p2:dispatch(setTabBarVisibleModule(p1))
		end
	end
end