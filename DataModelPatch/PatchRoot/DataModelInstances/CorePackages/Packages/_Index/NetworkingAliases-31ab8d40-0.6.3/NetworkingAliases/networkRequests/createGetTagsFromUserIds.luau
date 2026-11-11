local ALIASURLModule = require(script.Parent.Parent.ALIAS_URL)
local _ = require(script.Parent.Parent.networkingAliasesTypes)

return function(p1)
	-- upvalues: ALIASURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "GetTagsFromUserIds" }, function(Callback, TargetUserIds)
		-- upvalues: ALIASURLModule (upval)
		return Callback(ALIASURLModule):path("v1"):path("user"):path("get-tags"):body({ targetUserIds = TargetUserIds })
	end)
end