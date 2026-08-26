local ALIAS_URLModule = require(script.Parent.Parent.ALIAS_URL)
local _ = require(script.Parent.Parent.networkingAliasesTypes)

return function(p1)
	-- upvalues: ALIAS_URLModule (ref)
	return p1.roduxNetworking.POST({ Name = "GetTagsFromUserIds" }, function(p2, p3)
		-- upvalues: ALIAS_URLModule (copy)
		return p2(ALIAS_URLModule):path("v1"):path("user"):path("get-tags"):body({ targetUserIds = p3 })
	end)
end