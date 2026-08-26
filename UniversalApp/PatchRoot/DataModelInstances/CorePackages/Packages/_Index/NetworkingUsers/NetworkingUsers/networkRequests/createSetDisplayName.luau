local USERS_URLModule = require(script.Parent.Parent.USERS_URL)

return function(p1)
	-- upvalues: USERS_URLModule (ref)
	return p1.roduxNetworking.PATCH({ Name = "SetDisplayName" }, function(p2, p3, p4)
		-- upvalues: USERS_URLModule (copy)
		return p2(USERS_URLModule):path("v1"):path("users"):id(p3):path("display-names"):body({ newDisplayName = p4 })
	end)
end