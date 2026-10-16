local CALLURLModule = require(script.Parent.Parent.CALL_URL)
local _ = require(script.Parent.Parent.networkingCallTypes)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: CALLURLModule (copy)
	return (p1.roduxNetworking.GET({ Name = "GetSuggestedCallees" }, function(Callback) --[[ Line: 8 ]]
		-- upvalues: CALLURLModule (upval)
		return Callback(CALLURLModule):path("call"):path("v1"):path("get-suggested-callees")
	end))
end