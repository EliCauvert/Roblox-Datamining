local DependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local Roact = DependenciesModule.Roact
local RoactNavigation = DependenciesModule.RoactNavigation
local config = {
	state = { routeName = "", key = "", params = {} },
	dispatch = function() --[[ Line: 11 ]] end,
	goBack = function() --[[ Line: 12 ]] end,
	addListener = function() --[[ Line: 13 ]] end,
	isFocused = function() --[[ Line: 14 ]] end,
	setParams = function() --[[ Line: 15 ]] end,
	getParam = function() --[[ Line: 16 ]] end
}

return function(Element) --[[ Line: 19 ]]
	-- upvalues: Roact (copy), RoactNavigation (copy), config (copy)
	return Roact.createElement(RoactNavigation.Provider, { value = config }, { Element = Element })
end