local Parent = script:FindFirstAncestor("UserProfiles").Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateIsRobloxSubscriberGetterModule = require(script.Parent.createIsRobloxSubscriberGetter)

return function(p1)
	-- upvalues: ReactModule (copy), CreateIsRobloxSubscriberGetterModule (copy), UseSignalStateFunction (copy)
	return (UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: CreateIsRobloxSubscriberGetterModule (upval), p1 (copy)
		return CreateIsRobloxSubscriberGetterModule(p1)
	end, { p1 }))))
end