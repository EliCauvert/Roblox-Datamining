local ActionModule = require(script.Parent.Action)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: ActionModule (copy)
	local Name = if type(p1) == "string" then p1 else p1.Name
	
	return {
		Succeeded = ActionModule(Name .. "_Succeeded", function(Ids, ResponseBody, NamedIds, p2, AdditionalData) --[[ Line: 14 ]]
			return {
				ids = Ids,
				responseBody = ResponseBody,
				namedIds = NamedIds,
				postBody = p2 and p2.postBody or nil,
				queryArgs = p2 and p2.queryArgs,
				additionalData = AdditionalData
			}
		end),
		Failed = ActionModule(Name .. "_Failed", function(Ids, p2, NamedIds, p3, AdditionalData) --[[ Line: 24 ]]
			return {
				ids = Ids,
				error = p2,
				namedIds = NamedIds,
				postBody = p3 and p3.postBody or nil,
				queryArgs = p3 and p3.queryArgs or nil,
				additionalData = AdditionalData
			}
		end)
	}
end