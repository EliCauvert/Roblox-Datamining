local parent = script:FindFirstAncestor("UserProfiles").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local createIsRobloxSubscriberGetterModule = require(script.Parent.createIsRobloxSubscriberGetter)

return function(p1)
	-- upvalues: reactModule (ref), createIsRobloxSubscriberGetterModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalBinding(reactModule.useMemo(function()
		-- upvalues: createIsRobloxSubscriberGetterModule (copy), p1 (ref)
		return createIsRobloxSubscriberGetterModule(p1)
	end, { p1 }))
end