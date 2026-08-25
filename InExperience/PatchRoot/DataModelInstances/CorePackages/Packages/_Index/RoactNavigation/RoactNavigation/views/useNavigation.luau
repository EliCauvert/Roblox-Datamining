local reactModule = require(script.Parent.Parent.Parent.React)
local navigationContextModule = require(script.Parent.NavigationContext)

return function()
	-- upvalues: reactModule (ref), navigationContextModule (ref)
	return reactModule.useContext(navigationContextModule)
end