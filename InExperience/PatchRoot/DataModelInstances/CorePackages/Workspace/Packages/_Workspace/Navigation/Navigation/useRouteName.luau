local UseNavigationModule = require(script.Parent.useNavigation)

return function() --[[ Line: 8 | Named "useRouteName" ]]
	-- upvalues: UseNavigationModule (copy)
	return UseNavigationModule().state.routeName
end