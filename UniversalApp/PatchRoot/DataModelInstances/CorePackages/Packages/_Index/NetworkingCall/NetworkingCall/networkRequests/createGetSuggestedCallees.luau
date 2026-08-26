local CALL_URLModule = require(script.Parent.Parent.CALL_URL)
local _ = require(script.Parent.Parent.networkingCallTypes)

return function(p1)
	-- upvalues: CALL_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetSuggestedCallees" }, function(p2)
		-- upvalues: CALL_URLModule (copy)
		return p2(CALL_URLModule):path("call"):path("v1"):path("get-suggested-callees")
	end)
end