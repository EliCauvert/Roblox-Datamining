local parent = script:FindFirstAncestor("UserProfiles").Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local createIsRobloxSubscriberGetterModule = require(script.Parent.createIsRobloxSubscriberGetter)

return function(p1)
	-- upvalues: reactModule (ref), createIsRobloxSubscriberGetterModule (ref), useSignalState (ref)
	return useSignalState(reactModule.useMemo(function()
		-- upvalues: createIsRobloxSubscriberGetterModule (copy), p1 (ref)
		return createIsRobloxSubscriberGetterModule(p1)
	end, { p1 }))
end