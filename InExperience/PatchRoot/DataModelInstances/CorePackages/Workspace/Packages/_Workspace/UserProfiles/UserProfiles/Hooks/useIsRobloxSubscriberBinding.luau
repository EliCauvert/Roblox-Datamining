local parent = script:FindFirstAncestor("UserProfiles").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local createIsRobloxSubscriberGetterModule = require(script.Parent.createIsRobloxSubscriberGetter)

return function(p0)
	-- upvalues: reactModule (ref), createIsRobloxSubscriberGetterModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalBinding(reactModule.useMemo(function()
		-- upvalues: createIsRobloxSubscriberGetterModule (copy), p0 (ref)
		return createIsRobloxSubscriberGetterModule(p0)
	end, { p0 }))
end