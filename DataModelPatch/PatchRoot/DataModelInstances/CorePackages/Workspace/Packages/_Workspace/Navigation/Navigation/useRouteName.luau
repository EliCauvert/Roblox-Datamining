local UseNavigationModule = require(script.Parent.useNavigation)

return function()
	-- upvalues: UseNavigationModule (copy)
	return UseNavigationModule().state.routeName
end