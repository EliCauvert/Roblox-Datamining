local useNavigationModule = require(script.Parent.useNavigation)

return function() --[[ line: 8 | named "useRouteName" ]]
	-- upvalues: useNavigationModule (ref)
	return useNavigationModule().state.routeName
end