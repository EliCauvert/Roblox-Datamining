local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.GET("GetSocialLinks", function(Callback, p2) --[[ Line: 17 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("v1"):path("users"):id(p2.userId):path("promotion-channels"):queryArgs({
			alwaysReturnUrls = p2.alwaysReturnUrls,
			filterLink = p2.filterLink
		})
	end)
end