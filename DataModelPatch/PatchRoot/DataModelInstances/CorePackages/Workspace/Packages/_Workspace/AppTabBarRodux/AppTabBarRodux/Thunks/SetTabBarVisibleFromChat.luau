local AppTabBarRodux = script:FindFirstAncestor("AppTabBarRodux")
local ArgCheckModule = require(AppTabBarRodux.Parent.ArgCheck)
local SetTabBarVisibleModule = require(AppTabBarRodux.Actions.SetTabBarVisible)

return function(TabBarVisible)
	-- upvalues: ArgCheckModule (copy), SetTabBarVisibleModule (copy)
	ArgCheckModule.isType(TabBarVisible, "boolean", "SetTabBarVisibleFromChat.isVisible")
	
	return function(p1)
		-- upvalues: TabBarVisible (copy), SetTabBarVisibleModule (upval)
		local State = p1:getState()
		
		if not State.ChatAppReducer.ToggleChatPaused and State.TabBarVisible ~= TabBarVisible then
			p1:dispatch(SetTabBarVisibleModule(TabBarVisible))
		end
	end
end