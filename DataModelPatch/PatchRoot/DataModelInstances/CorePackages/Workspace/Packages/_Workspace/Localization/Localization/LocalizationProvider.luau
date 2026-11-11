local ReactModule = require(script:FindFirstAncestor("Localization").Parent.React)
local LocalizationRoactContextModule = require(script.Parent.LocalizationRoactContext)

return function(p1)
	-- upvalues: ReactModule (copy), LocalizationRoactContextModule (copy)
	return ReactModule.createElement(LocalizationRoactContextModule.Provider, { value = p1.localization }, p1.children)
end