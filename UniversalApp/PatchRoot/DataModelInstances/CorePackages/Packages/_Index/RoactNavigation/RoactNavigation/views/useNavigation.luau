local ReactModule = require(script.Parent.Parent.Parent.React)
local NavigationContextModule = require(script.Parent.NavigationContext)

return function() --[[ Line: 8 | Named "useNavigation" ]]
	-- upvalues: ReactModule (copy), NavigationContextModule (copy)
	return ReactModule.useContext(NavigationContextModule)
end