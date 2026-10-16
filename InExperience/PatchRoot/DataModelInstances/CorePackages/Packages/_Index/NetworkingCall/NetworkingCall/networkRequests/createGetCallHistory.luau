local CALLURLModule = require(script.Parent.Parent.CALL_URL)
local _ = require(script.Parent.Parent.networkingCallTypes)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: CALLURLModule (copy)
	return (p1.roduxNetworking.GET({ Name = "GetCallHistory" }, function(Callback, p2) --[[ Line: 10 ]]
		-- upvalues: CALLURLModule (upval)
		return Callback(CALLURLModule):path("call"):path("v1"):path("get-call-history"):queryArgs({
			universeId = if p2 then p2.universeId else nil,
			limit = if p2 then p2.limit else nil,
			cursor = if p2 then p2.cursor else nil
		})
	end))
end