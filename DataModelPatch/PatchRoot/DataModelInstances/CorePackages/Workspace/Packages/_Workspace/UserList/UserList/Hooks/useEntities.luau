local UserList = script:FindFirstAncestor("UserList")
local ReactModule = require(UserList.Parent.React)
local _ = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)

return function(p1)
	-- upvalues: ReactModule (copy)
	return (ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local EntitiesMap = {}
		
		for _, value in p1 do
			EntitiesMap[value.id] = value
		end
		return { entitiesMap = EntitiesMap }
	end, { p1 }))
end