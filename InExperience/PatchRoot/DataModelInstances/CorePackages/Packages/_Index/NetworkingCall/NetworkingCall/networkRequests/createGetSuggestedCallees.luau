local CALL_URLModule = require(script.Parent.Parent.CALL_URL)
local _ = require(script.Parent.Parent.networkingCallTypes)

return function(p0)
	-- upvalues: CALL_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetSuggestedCallees" }, function(p1)
		-- upvalues: CALL_URLModule (copy)
		return p1(CALL_URLModule):path("call"):path("v1"):path("get-suggested-callees")
	end)
end