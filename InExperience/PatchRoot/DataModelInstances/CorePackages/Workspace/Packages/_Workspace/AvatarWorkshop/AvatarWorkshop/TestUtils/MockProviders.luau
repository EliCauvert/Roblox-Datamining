local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local ReactModule = require(AvatarWorkshop.Parent.React)
local ContextProvidersModule = require(AvatarWorkshop.Internal.ContextProviders)

return function(p1)
	-- upvalues: ReactModule (copy), ContextProvidersModule (copy)
	return ReactModule.createElement(ContextProvidersModule, { theme = "Dark" }, p1.children)
end