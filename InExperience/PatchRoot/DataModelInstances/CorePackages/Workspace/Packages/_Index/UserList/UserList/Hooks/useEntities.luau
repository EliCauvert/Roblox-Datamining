local userList = script:FindFirstAncestor("UserList")
local reactModule = require(userList.Parent.React)
local _ = require(userList.Common.Enums)
local _ = require(userList.Common.Types)

return function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		local t = {}
		
		for i, v in p1 do
			t[v.id] = v
		end
		return { entitiesMap = t }
	end, { p1 })
end