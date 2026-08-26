local parent = script:FindFirstAncestor("PeopleReactView").Parent
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)

return function(p1)
	-- upvalues: reactModule (ref), peopleServiceModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy), p1 (ref)
		return peopleServiceModule.getService(p1)
	end, {})
end