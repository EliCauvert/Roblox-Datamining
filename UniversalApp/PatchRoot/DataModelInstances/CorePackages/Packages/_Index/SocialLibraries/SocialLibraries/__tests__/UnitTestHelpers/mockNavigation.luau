local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local roact = dependenciesModule.Roact
local roactNavigation = dependenciesModule.RoactNavigation
local t = {
	state = { routeName = "", key = "", params = {} },
	dispatch = function() --[[ line: 11 ]] end,
	goBack = function() --[[ line: 12 ]] end,
	addListener = function() --[[ line: 13 ]] end,
	isFocused = function() --[[ line: 14 ]] end,
	setParams = function() --[[ line: 15 ]] end,
	getParam = function() --[[ line: 16 ]] end
}

return function(p0) --[[ line: 19 ]]
	-- upvalues: roact (ref), roactNavigation (ref), t (ref)
	return roact.createElement(roactNavigation.Provider, { value = t }, { Element = p0 })
end