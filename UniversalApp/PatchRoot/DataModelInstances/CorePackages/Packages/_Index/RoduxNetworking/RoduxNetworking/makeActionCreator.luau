local actionModule = require(script.Parent.Action)

return function(p1)
	-- upvalues: actionModule (ref)
	local var1 = if type(p1) == "string" then p1 else p1.Name
	
	return {
		Succeeded = actionModule(var1 .. "_Succeeded", function(p2, p3, p4, p5, p6)
			return {
				ids = p2,
				responseBody = p3,
				namedIds = p4,
				postBody = if p5 then p5.postBody else nil,
				queryArgs = p5 and p5.queryArgs,
				additionalData = p6
			}
		end),
		Failed = actionModule(var1 .. "_Failed", function(p2, p3, p4, p5, p6)
			return {
				ids = p2,
				error = p3,
				namedIds = p4,
				postBody = if p5 then p5.postBody else nil,
				queryArgs = if p5 then p5.queryArgs else nil,
				additionalData = p6
			}
		end)
	}
end