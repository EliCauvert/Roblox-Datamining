local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p1)
	-- upvalues: urlBuilder (ref)
	return p1(urlBuilder.fromString("auth:v1/session/refresh")(), "POST", { postBody = "" })
end