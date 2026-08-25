local parent = script.Parent.Parent
local reactModule = require(parent.React)
local context = require(parent.RoactNavigation).Context
local useSignalState = require(parent.SignalsReact).useSignalState
local _ = require(script.Parent.createSignalsNavigationObject)

return function(value)
	-- upvalues: useSignalState (ref), reactModule (ref), context (ref)
	local var1 = useSignalState(value.navigation.getNavigation)
	reactModule.useEffect(function()
		-- upvalues: value (ref)
		value.navigation.notifyEvents()
	end)
	
	return reactModule.createElement(context.Provider, { value = var1 }, value.children)
end