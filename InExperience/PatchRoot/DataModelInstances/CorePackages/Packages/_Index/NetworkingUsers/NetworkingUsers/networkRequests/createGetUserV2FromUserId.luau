local USERSURLModule = require(script.Parent.Parent.USERS_URL)

return function(p1) --[[ Line: 3 ]]
	-- upvalues: USERSURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetUserV2FromUserId" }, function(Callback, p2) --[[ Line: 6 ]]
		-- upvalues: USERSURLModule (upval)
		return Callback(USERSURLModule):path("v1"):path("users"):id(p2)
	end)
end