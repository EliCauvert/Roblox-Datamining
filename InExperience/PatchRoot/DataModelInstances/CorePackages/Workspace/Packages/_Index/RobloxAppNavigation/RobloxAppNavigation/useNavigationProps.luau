local useNavigation = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.Navigation).useNavigation
local _ = require(script.Parent.types)

return function(p0) --[[ line: 8 | named "useNavigationProps" ]]
	-- upvalues: useNavigation (ref)
	local var0 = useNavigation()
	
	return p0(var0.getParam("detail"), var0.getParam("extraProps", {}), var0)
end