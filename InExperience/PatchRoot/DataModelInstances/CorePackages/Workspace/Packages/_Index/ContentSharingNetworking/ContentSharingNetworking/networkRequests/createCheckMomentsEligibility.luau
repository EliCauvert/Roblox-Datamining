local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.GET("CheckMomentsEligibility", function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule):path("content-captures-api"):path("v1"):path("check-moments-eligibility"):queryArgs({
			contentType = p3.contentType,
			experienceId = p3.experienceId
		})
	end)
end