local useNavigation = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.Navigation).useNavigation
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: useNavigation (ref)
	local var1 = useNavigation()
	
	return p1(var1.getParam("detail"), var1.getParam("extraProps", {}), var1)
end