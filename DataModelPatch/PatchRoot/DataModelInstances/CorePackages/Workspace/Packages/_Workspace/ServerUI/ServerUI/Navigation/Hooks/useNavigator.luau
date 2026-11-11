local ServerUI = script:FindFirstAncestor("ServerUI")
local ReactModule = require(ServerUI.Parent.React)
local NavigationContextModule = require(ServerUI.Navigation.NavigationContext)

return function()
	-- upvalues: ReactModule (copy), NavigationContextModule (copy)
	return ReactModule.useContext(NavigationContextModule)
end