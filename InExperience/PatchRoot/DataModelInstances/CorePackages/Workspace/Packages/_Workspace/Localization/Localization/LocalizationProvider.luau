local reactModule = require(script:FindFirstAncestor("Localization").Parent.React)
local localizationRoactContextModule = require(script.Parent.LocalizationRoactContext)

return function(p0)
	-- upvalues: reactModule (ref), localizationRoactContextModule (ref)
	return reactModule.createElement(localizationRoactContextModule.Provider, { value = p0.localization }, p0.children)
end