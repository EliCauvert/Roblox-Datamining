local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local Context = require(Parent.RoactNavigation).Context
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local _ = require(script.Parent.createSignalsNavigationObject)

return function(p1)
	-- upvalues: UseSignalStateFunction (copy), ReactModule (copy), Context (copy)
	local UseSignalStateResult = UseSignalStateFunction(p1.navigation.getNavigation)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		p1.navigation.notifyEvents()
	end)
	
	return ReactModule.createElement(Context.Provider, { value = UseSignalStateResult }, p1.children)
end