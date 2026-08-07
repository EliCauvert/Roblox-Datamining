local parent = script:FindFirstAncestor("PeopleReactView").Parent
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)

return function(p0) --[[ line: 7 | named "useGetPeopleService" ]]
	-- upvalues: reactModule (ref), peopleServiceModule (ref)
	return reactModule.useMemo(function() --[[ line: 8 ]]
		-- upvalues: peopleServiceModule (copy), p0 (ref)
		return peopleServiceModule.getService(p0)
	end, {})
end