local DependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local Roact = DependenciesModule.Roact
local RoactNavigation = DependenciesModule.RoactNavigation
local config = {
	state = { routeName = "", key = "", params = {} },
	dispatch = function() end,
	goBack = function() end,
	addListener = function() end,
	isFocused = function() end,
	setParams = function() end,
	getParam = function() end
}

return function(Element)
	-- upvalues: Roact (copy), RoactNavigation (copy), config (copy)
	return Roact.createElement(RoactNavigation.Provider, { value = config }, { Element = Element })
end