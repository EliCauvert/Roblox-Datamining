local AppTabBarRodux = script:FindFirstAncestor("AppTabBarRodux")
local ArgCheckModule = require(AppTabBarRodux.Parent.ArgCheck)
local SetTabBarVisibleModule = require(AppTabBarRodux.Actions.SetTabBarVisible)

return function(TabBarVisible)
	-- upvalues: ArgCheckModule (copy), SetTabBarVisibleModule (copy)
	ArgCheckModule.isType(TabBarVisible, "boolean", "SetTabBarVisibleFromMoments.isVisible")
	
	return function(p1)
		-- upvalues: TabBarVisible (copy), SetTabBarVisibleModule (upval)
		if p1:getState().TabBarVisible ~= TabBarVisible then
			p1:dispatch(SetTabBarVisibleModule(TabBarVisible))
		end
	end
end