local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local ReactModule = require(Parent.React)
local PeopleServiceModule = require(Parent.PeopleService)

return function(p1)
	-- upvalues: ReactModule (copy), PeopleServiceModule (copy)
	return (ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval), p1 (copy)
		return PeopleServiceModule.getService(p1)
	end, {}))
end