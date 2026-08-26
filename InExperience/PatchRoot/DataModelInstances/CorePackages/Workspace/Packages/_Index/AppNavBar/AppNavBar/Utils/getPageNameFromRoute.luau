local parent = script.Parent.Parent.Parent
local _ = require(parent.Navigation)
local navigationRoduxModule = require(parent.NavigationRodux)
local t = {
	[navigationRoduxModule.Constants.TempRnSwitchNavigatorName] = true
}

if require(parent.SharedFlags).FFlagAppIaHomeSubTab then
	t[navigationRoduxModule.Constants.HomeContainerName] = true
end
return function(p1)
	-- upvalues: t (ref)
	if not p1 then
		return nil
	end
	local var1 = p1
	while t[var1.routeName] and (var1.routes and var1.index) do
		var1 = var1.routes[var1.index]
	end
	return var1.routeName
end