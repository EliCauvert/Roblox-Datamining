local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.GET("CheckMomentsEligibility", function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("content-captures-api"):path("v1"):path("check-moments-eligibility"):queryArgs({
			contentType = p2.contentType,
			experienceId = p2.experienceId
		})
	end)
end