local CALL_URLModule = require(script.Parent.Parent.CALL_URL)
local _ = require(script.Parent.Parent.networkingCallTypes)

return function(p1)
	-- upvalues: CALL_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetCallHistory" }, function(p2, p3)
		-- upvalues: CALL_URLModule (copy)
		return p2(CALL_URLModule):path("call"):path("v1"):path("get-call-history"):queryArgs({
			universeId = if p3 then p3.universeId else nil,
			limit = if p3 then p3.limit else nil,
			cursor = if p3 then p3.cursor else nil
		})
	end)
end