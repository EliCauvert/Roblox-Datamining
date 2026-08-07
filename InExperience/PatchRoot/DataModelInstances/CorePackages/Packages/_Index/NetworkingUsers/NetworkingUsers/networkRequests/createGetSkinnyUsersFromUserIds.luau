local USERS_URLModule = require(script.Parent.Parent.USERS_URL)

return function(p0) --[[ line: 3 ]]
	-- upvalues: USERS_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "GetSkinnyUsersFromUserIds" }, function(p1, p2) --[[ line: 6 ]]
		-- upvalues: USERS_URLModule (copy)
		return p1(USERS_URLModule):path("v1"):path("users"):body({ userIds = p2 })
	end)
end