local Parent = script.Parent.Parent
local _ = require(Parent.networkingPresenceTypes)
local PRESENCEURLModule = require(Parent.PRESENCE_URL)

return function(p1)
	-- upvalues: PRESENCEURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "GetPresencesFromUserIds" }, function(Callback, UserIds)
		-- upvalues: PRESENCEURLModule (upval)
		return Callback(PRESENCEURLModule):path("v1"):path("presence"):path("users"):body({ userIds = UserIds }):setStatusIds(UserIds)
	end)
end