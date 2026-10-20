local USERSURLModule = require(script.Parent.Parent.USERS_URL)

return function(p1)
	-- upvalues: USERSURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "GetSkinnyUsersFromUserIds" }, function(Callback, UserIds)
		-- upvalues: USERSURLModule (upval)
		return Callback(USERSURLModule):path("v1"):path("users"):body({ userIds = UserIds })
	end)
end