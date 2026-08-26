local setTabBarVisibleModule = require(script:FindFirstAncestor("AppTabBarRodux").Actions.SetTabBarVisible)

return function(p1, p2)
	-- upvalues: setTabBarVisibleModule (ref)
	if p1 == nil then
		p1 = false
	end
	if p2.type == setTabBarVisibleModule.name then
		p1 = p2.isVisible
	end
	return p1
end