local userList = script:FindFirstAncestor("UserList")
local reactModule = require(userList.Parent.React)
local _ = require(userList.Common.Enums)
local _ = require(userList.Common.Types)

return function(p0) --[[ line: 19 | named "useEntities" ]]
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function() --[[ line: 20 ]]
		-- upvalues: p0 (ref)
		local t = {}
		
		for i, v in p0 do
			t[v.id] = v
		end
		return { entitiesMap = t }
	end, { p0 })
end