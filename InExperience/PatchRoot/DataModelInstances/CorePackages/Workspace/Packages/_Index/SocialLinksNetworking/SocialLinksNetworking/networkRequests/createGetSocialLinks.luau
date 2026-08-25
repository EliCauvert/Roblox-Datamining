local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0)
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.GET("GetSocialLinks", function(p1, p2)
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("v1"):path("users"):id(p2.userId):path("promotion-channels"):queryArgs({
			alwaysReturnUrls = p2.alwaysReturnUrls,
			filterLink = p2.filterLink
		})
	end)
end