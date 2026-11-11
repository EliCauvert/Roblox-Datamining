local Parent = script:FindFirstAncestor("UserProfiles").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local CreateIsRobloxSubscriberGetterModule = require(script.Parent.createIsRobloxSubscriberGetter)

return function(p1)
	-- upvalues: ReactModule (copy), CreateIsRobloxSubscriberGetterModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
		-- upvalues: CreateIsRobloxSubscriberGetterModule (upval), p1 (copy)
		return CreateIsRobloxSubscriberGetterModule(p1)
	end, { p1 })))
end