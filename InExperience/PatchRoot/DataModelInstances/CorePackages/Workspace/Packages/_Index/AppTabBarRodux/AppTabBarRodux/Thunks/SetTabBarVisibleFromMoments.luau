local appTabBarRodux = script:FindFirstAncestor("AppTabBarRodux")
local argCheckModule = require(appTabBarRodux.Parent.ArgCheck)
local setTabBarVisibleModule = require(appTabBarRodux.Actions.SetTabBarVisible)

return function(p0)
	-- upvalues: argCheckModule (ref), setTabBarVisibleModule (ref)
	argCheckModule.isType(p0, "boolean", "SetTabBarVisibleFromMoments.isVisible")
	
	return function(p1)
		-- upvalues: p0 (ref), setTabBarVisibleModule (copy)
		if p1:getState().TabBarVisible ~= p0 then
			p1:dispatch(setTabBarVisibleModule(p0))
		end
	end
end