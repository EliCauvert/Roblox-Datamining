local CALL_URLModule = require(script.Parent.Parent.CALL_URL)
local _ = require(script.Parent.Parent.networkingCallTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: CALL_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetCallHistory" }, function(p1, p2) --[[ line: 10 ]]
		-- upvalues: CALL_URLModule (copy)
		return p1(CALL_URLModule):path("call"):path("v1"):path("get-call-history"):queryArgs({
			universeId = if p2 then p2.universeId else nil,
			limit = if p2 then p2.limit else nil,
			cursor = if p2 then p2.cursor else nil
		})
	end)
end