local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 13 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.GET("GetSelfSocialLinks", function(Callback, p2) --[[ Line: 16 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("v1"):path("promotion-channels"):queryArgs({
			alwaysReturnUrls = p2.alwaysReturnUrls,
			filterLink = p2.filterLink
		})
	end)
end