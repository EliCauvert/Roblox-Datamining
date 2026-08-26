local appTabBarRodux = script:FindFirstAncestor("AppTabBarRodux")
local argCheckModule = require(appTabBarRodux.Parent.ArgCheck)
local setTabBarVisibleModule = require(appTabBarRodux.Actions.SetTabBarVisible)

return function(p1)
	-- upvalues: argCheckModule (ref), setTabBarVisibleModule (ref)
	argCheckModule.isType(p1, "boolean", "SetTabBarVisibleFromChat.isVisible")
	
	return function(p2)
		-- upvalues: p1 (ref), setTabBarVisibleModule (copy)
		local state = p2:getState()
		
		if not state.ChatAppReducer.ToggleChatPaused and state.TabBarVisible ~= p1 then
			p2:dispatch(setTabBarVisibleModule(p1))
		end
	end
end