local ALIASURLModule = require(script.Parent.Parent.ALIAS_URL)
local _ = require(script.Parent.Parent.networkingAliasesTypes)

return function(p1)
	-- upvalues: ALIASURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "SetUserTag" }, function(Callback, TargetUserId, UserTag)
		-- upvalues: ALIASURLModule (upval)
		return Callback(ALIASURLModule):path("v1"):path("user"):path("tag"):body({ targetUserId = TargetUserId, userTag = UserTag })
	end)
end