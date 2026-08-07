local setTabBarVisibleModule = require(script:FindFirstAncestor("AppTabBarRodux").Actions.SetTabBarVisible)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: setTabBarVisibleModule (ref)
	if p0 == nil then
		p0 = false
	end
	if p1.type == setTabBarVisibleModule.name then
		p0 = p1.isVisible
	end
	return p0
end