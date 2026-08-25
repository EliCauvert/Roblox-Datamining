local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0)
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.GET("CheckMomentsEligibility", function(p1, p2)
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("content-captures-api"):path("v1"):path("check-moments-eligibility"):queryArgs({
			contentType = p2.contentType,
			experienceId = p2.experienceId
		})
	end)
end