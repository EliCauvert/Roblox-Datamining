local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local roact = dependenciesModule.Roact
local roactNavigation = dependenciesModule.RoactNavigation
local t = {
	state = { routeName = "", key = "", params = {} },
	dispatch = function() end,
	goBack = function() end,
	addListener = function() end,
	isFocused = function() end,
	setParams = function() end,
	getParam = function() end
}

return function(p0)
	-- upvalues: roact (ref), roactNavigation (ref), t (ref)
	return roact.createElement(roactNavigation.Provider, { value = t }, { Element = p0 })
end