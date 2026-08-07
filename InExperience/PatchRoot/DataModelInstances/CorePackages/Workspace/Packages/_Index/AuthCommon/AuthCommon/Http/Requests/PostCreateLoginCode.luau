local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p0) --[[ line: 6 ]]
	-- upvalues: urlBuilder (ref)
	return p0(urlBuilder.fromString("apis:auth-token-service/v1/login/create")(), "POST", { postBody = "" })
end