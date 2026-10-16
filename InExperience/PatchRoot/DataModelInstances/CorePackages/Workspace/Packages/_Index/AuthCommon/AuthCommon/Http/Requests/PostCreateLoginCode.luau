local UrlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(Callback) --[[ Line: 6 ]]
	-- upvalues: UrlBuilder (copy)
	return Callback(UrlBuilder.fromString("apis:auth-token-service/v1/login/create")(), "POST", { postBody = "" })
end