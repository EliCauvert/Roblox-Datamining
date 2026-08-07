local actionModule = require(script.Parent.Action)

return function(p0) --[[ line: 5 ]]
	-- upvalues: actionModule (ref)
	local var1 = if type(p0) == "string" then p0 else p0.Name
	
	return {
		Succeeded = actionModule(var1 .. "_Succeeded", function(p1, p2, p3, p4, p5) --[[ line: 14 ]]
			return {
				ids = p1,
				responseBody = p2,
				namedIds = p3,
				postBody = if p4 then p4.postBody else nil,
				queryArgs = p4 and p4.queryArgs,
				additionalData = p5
			}
		end),
		Failed = actionModule(var1 .. "_Failed", function(p6, p7, p8, p9, p10) --[[ line: 24 ]]
			return {
				ids = p6,
				error = p7,
				namedIds = p8,
				postBody = if p9 then p9.postBody else nil,
				queryArgs = if p9 then p9.queryArgs else nil,
				additionalData = p10
			}
		end)
	}
end