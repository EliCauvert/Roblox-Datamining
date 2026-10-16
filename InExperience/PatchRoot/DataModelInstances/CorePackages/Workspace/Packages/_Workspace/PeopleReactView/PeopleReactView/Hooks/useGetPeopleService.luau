local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local ReactModule = require(Parent.React)
local PeopleServiceModule = require(Parent.PeopleService)

return function(p1) --[[ Line: 7 | Named "useGetPeopleService" ]]
	-- upvalues: ReactModule (copy), PeopleServiceModule (copy)
	return (ReactModule.useMemo(function() --[[ Line: 8 ]]
		-- upvalues: PeopleServiceModule (upval), p1 (copy)
		return PeopleServiceModule.getService(p1)
	end, {}))
end