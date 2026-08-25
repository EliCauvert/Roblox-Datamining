local USERS_URLModule = require(script.Parent.Parent.USERS_URL)

return function(p0)
	-- upvalues: USERS_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetUsernameHistoryFromUserId" }, function(p1, p2)
		-- upvalues: USERS_URLModule (copy)
		return p1(USERS_URLModule):path("v1"):path("users"):id(p2):path("username-history")
	end)
end