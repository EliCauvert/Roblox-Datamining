local reactModule = require(script:FindFirstAncestor("Localization").Parent.React)
local localizationRoactContextModule = require(script.Parent.LocalizationRoactContext)

return function(p1)
	-- upvalues: reactModule (ref), localizationRoactContextModule (ref)
	return reactModule.createElement(localizationRoactContextModule.Provider, { value = p1.localization }, p1.children)
end