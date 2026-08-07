local ALIAS_URLModule = require(script.Parent.Parent.ALIAS_URL)
local _ = require(script.Parent.Parent.networkingAliasesTypes)

return function(p0) --[[ line: 4 ]]
	-- upvalues: ALIAS_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "GetTagsFromUserIds" }, function(p1, p2) --[[ line: 7 ]]
		-- upvalues: ALIAS_URLModule (copy)
		return p1(ALIAS_URLModule):path("v1"):path("user"):path("get-tags"):body({ targetUserIds = p2 })
	end)
end