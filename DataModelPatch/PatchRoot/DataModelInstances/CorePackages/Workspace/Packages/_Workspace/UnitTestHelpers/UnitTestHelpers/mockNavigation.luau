local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local config = {
	state = { routeName = "", key = "", params = {} },
	dispatch = function() end,
	goBack = function() end,
	addListener = function()
		return { remove = function() end }
	end,
	isFocused = function() end,
	setParams = function() end,
	getParam = function() end,
	replace = function() end,
	push = function() end,
	navigate = function() end
}

return function(Element)
	-- upvalues: RoactModule (copy), RoactNavigationModule (copy), config (copy)
	return RoactModule.createElement(RoactNavigationModule.Provider, { value = config }, { Element = Element })
end