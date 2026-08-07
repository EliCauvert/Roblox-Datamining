local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p0) --[[ line: 6 ]]
	-- upvalues: urlBuilder (ref)
	return p0(urlBuilder.fromString("auth:v1/session/refresh")(), "POST", { postBody = "" })
end