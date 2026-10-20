local SetTabBarVisibleModule = require(script:FindFirstAncestor("AppTabBarRodux").Actions.SetTabBarVisible)

return function(IsVisible, p1)
	-- upvalues: SetTabBarVisibleModule (copy)
	if IsVisible == nil then
		IsVisible = false
	end
	if p1.type == SetTabBarVisibleModule.name then
		IsVisible = p1.isVisible
	end
	return IsVisible
end