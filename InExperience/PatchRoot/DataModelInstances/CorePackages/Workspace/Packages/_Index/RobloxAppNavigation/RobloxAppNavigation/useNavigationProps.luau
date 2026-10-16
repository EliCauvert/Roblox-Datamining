local UseNavigationFunction = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.Navigation).useNavigation
local _ = require(script.Parent.types)

return function(Callback) --[[ Line: 8 | Named "useNavigationProps" ]]
	-- upvalues: UseNavigationFunction (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return Callback(UseNavigationResult.getParam("detail"), UseNavigationResult.getParam("extraProps", {}), UseNavigationResult)
end