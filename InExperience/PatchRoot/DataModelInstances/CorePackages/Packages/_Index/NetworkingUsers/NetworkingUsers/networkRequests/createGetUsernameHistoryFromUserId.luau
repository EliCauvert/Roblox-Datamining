local USERS_URLModule = require(script.Parent.Parent.USERS_URL)

return function(p1)
	-- upvalues: USERS_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetUsernameHistoryFromUserId" }, function(p2, p3)
		-- upvalues: USERS_URLModule (copy)
		return p2(USERS_URLModule):path("v1"):path("users"):id(p3):path("username-history")
	end)
end