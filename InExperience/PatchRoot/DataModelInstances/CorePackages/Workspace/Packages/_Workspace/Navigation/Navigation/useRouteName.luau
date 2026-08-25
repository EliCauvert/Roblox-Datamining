local useNavigationModule = require(script.Parent.useNavigation)

return function()
	-- upvalues: useNavigationModule (ref)
	return useNavigationModule().state.routeName
end