local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p1)
	-- upvalues: urlBuilder (ref)
	return p1(urlBuilder.fromString("apis:auth-token-service/v1/login/create")(), "POST", { postBody = "" })
end