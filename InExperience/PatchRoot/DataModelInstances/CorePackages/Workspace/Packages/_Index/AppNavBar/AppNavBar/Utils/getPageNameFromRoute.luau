local parent = script.Parent.Parent.Parent
local _ = require(parent.Navigation)
local navigationRoduxModule = require(parent.NavigationRodux)
local t = {
	[navigationRoduxModule.Constants.TempRnSwitchNavigatorName] = true
}

if require(parent.SharedFlags).FFlagAppIaHomeSubTab then
	t[navigationRoduxModule.Constants.HomeContainerName] = true
end
return function(p0)
	-- upvalues: t (ref)
	if not p0 then
		return nil
	end
	local var2 = p0
	while t[var2.routeName] and (var2.routes and var2.index) do
		var2 = var2.routes[var2.index]
	end
	return var2.routeName
end