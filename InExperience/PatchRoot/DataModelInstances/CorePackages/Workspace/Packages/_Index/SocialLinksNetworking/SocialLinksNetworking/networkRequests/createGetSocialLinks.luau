local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.GET("GetSocialLinks", function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule):path("v1"):path("users"):id(p3.userId):path("promotion-channels"):queryArgs({
			alwaysReturnUrls = p3.alwaysReturnUrls,
			filterLink = p3.filterLink
		})
	end)
end