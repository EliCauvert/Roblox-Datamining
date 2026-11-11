local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local ApiFetchUsersPresencesFunction = require(Parent.UserLib).Thunks.ApiFetchUsersPresences
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)

return function(p1, p2)
	-- upvalues: CryoModule (copy), PromiseModule (copy), ApiFetchUsersPresencesFunction (copy)
	return function(p3)
		-- upvalues: CryoModule (upval), p2 (copy), PromiseModule (upval), ApiFetchUsersPresencesFunction (upval), p1 (copy)
		return PromiseModule.all({
			p3:dispatch(ApiFetchUsersPresencesFunction(p1, (CryoModule.List.map(p2, function(p4): string
				return (tostring(p4.id))
			end))))
		})
	end
end