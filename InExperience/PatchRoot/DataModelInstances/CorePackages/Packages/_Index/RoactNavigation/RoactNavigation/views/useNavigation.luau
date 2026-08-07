local reactModule = require(script.Parent.Parent.Parent.React)
local navigationContextModule = require(script.Parent.NavigationContext)

return function() --[[ line: 8 | named "useNavigation" ]]
	-- upvalues: reactModule (ref), navigationContextModule (ref)
	return reactModule.useContext(navigationContextModule)
end