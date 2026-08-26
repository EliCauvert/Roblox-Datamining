local USERS_URLModule = require(script.Parent.Parent.USERS_URL)

return function(p1)
	-- upvalues: USERS_URLModule (ref)
	return p1.roduxNetworking.POST({ Name = "SetDescription" }, function(p2, p3, p4)
		-- upvalues: USERS_URLModule (copy)
		return p2(USERS_URLModule, { LocalUserId = p3 }):path("v1"):path("description"):body({ description = p4 })
	end)
end