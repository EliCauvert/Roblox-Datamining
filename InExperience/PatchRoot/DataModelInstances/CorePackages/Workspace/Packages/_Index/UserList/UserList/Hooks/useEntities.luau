local UserList = script:FindFirstAncestor("UserList")
local ReactModule = require(UserList.Parent.React)
local _ = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)

return function(p1) --[[ Line: 19 | Named "useEntities" ]]
	-- upvalues: ReactModule (copy)
	return (ReactModule.useMemo(function() --[[ Line: 20 ]]
		-- upvalues: p1 (copy)
		local EntitiesMap = {}
		
		for _, value in p1 do
			EntitiesMap[value.id] = value
		end
		return { entitiesMap = EntitiesMap }
	end, { p1 }))
end