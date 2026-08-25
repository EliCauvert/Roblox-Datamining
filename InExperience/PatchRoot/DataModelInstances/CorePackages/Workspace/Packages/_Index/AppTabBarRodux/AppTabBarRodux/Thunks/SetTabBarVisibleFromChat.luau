local appTabBarRodux = script:FindFirstAncestor("AppTabBarRodux")
local argCheckModule = require(appTabBarRodux.Parent.ArgCheck)
local setTabBarVisibleModule = require(appTabBarRodux.Actions.SetTabBarVisible)

return function(p0)
	-- upvalues: argCheckModule (ref), setTabBarVisibleModule (ref)
	argCheckModule.isType(p0, "boolean", "SetTabBarVisibleFromChat.isVisible")
	
	return function(p1)
		-- upvalues: p0 (ref), setTabBarVisibleModule (copy)
		local state = p1:getState()
		
		if not state.ChatAppReducer.ToggleChatPaused and state.TabBarVisible ~= p0 then
			p1:dispatch(setTabBarVisibleModule(p0))
		end
	end
end